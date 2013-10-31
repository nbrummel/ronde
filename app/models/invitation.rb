class Invitation < ActiveRecord::Base
  attr_accessible :accepted_at, :user_id, :friend_id, :status, :event_id
  belongs_to :event
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  def self.invite(user, friend, event) 
		unless user == friend or Invitation.find_by_user_id_and_friend_id_and_event_id(user.id, friend.id, event.id)
			transaction do 
				create(:user_id => user.id, :friend_id => friend.id, :status => 'pending', :event_id => event.id)
				create(:user_id => friend.id, :friend_id => user.id, :status => 'pending', :event_id => event.id)
			end
		end
	end

	def self.accept(user, friend, event)
		transaction do
			accepted_at = Time.now
			accept_one_side(user, friend, event, accepted_at)
		end
	end

	def self.accept_one_side(user, friend, event, accepted_at)
		request = find_by_user_id_and_friend_id_and_event_id(user.id, friend.id, event.id)
		request.status = 'confirmed'
		request.accepted_at = accepted_at
		request.save!
	end
end
