class Friendship < ActiveRecord::Base
	attr_accessible :accepted_at, :friend_id, :status, :user_id
	belongs_to :user
	belongs_to :friend, :class_name => 'User'

	def self.request(user, friend) 
		unless user == friend or Friendship.find_by_user_id_and_friend_id(user.id, friend.id) or Friendship.find_by_user_id_and_friend_id(friend.id, user.id)
			transaction do 
				create(:user_id => user.id, :friend_id => friend.id, :status => 'pending')
				create(:user_id => friend.id, :friend_id => user.id, :status => 'requested')
			end
		end
	end

	def self.accept(user, friend)
		transaction do
			accepted_at = Time.now
			accept_one_side(user, friend, accepted_at)
			accept_one_side(friend, user, accepted_at)
		end
	end

	def self.accept_one_side(user, friend, accepted_at)
		request = find_by_user_id_and_friend_id(user.id, friend.id)
		request.status = 'accepted'
		request.accepted_at = accepted_at
		request.save!
	end

	def self.remove(user, friend)
		self.remove_one_side(user, friend)
		self.remove_one_side(friend, user)
	end

	def self.remove_one_side(user, friend)
		request = find_by_user_id_and_friend_id(user.id, friend.id)
		request.destroy
	end

	def self.already_friends(user, friend)
		request = find_by_user_id_and_friend_id(user.id, friend.id)
		if (request && request.status == 'accepted') || user.id == friend.id
			return true
		else
			return false
		end
	end

	def self.already_sent_friend_request(user, friend)
		request = find_by_user_id_and_friend_id(user.id, friend.id)
		if request && request.status == 'pending'
			return true
		else
			return false
		end
	end
end
