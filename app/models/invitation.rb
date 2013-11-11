class Invitation < ActiveRecord::Base
  attr_accessible :accepted_at, :user_id, :invited_user_id, :status, :event_id

  # Associations
  belongs_to :event
  belongs_to :user
  belongs_to :invited_user, :class_name => "User"

  def self.invite(user, invited_user, event)
    unless user == invited_user or Invitation.find_by_user_id_and_invited_user_id_and_event_id(user.id, invited_user.id, event.id)
      transaction do
        create(:user_id => user.id, :invited_user_id => invited_user.id, :status => 'invited', :event_id => event.id)
      end
    end
  end

  def self.accept(user, invited_user, event)
    transaction do
      accepted_at = Time.now
      accept_one_side(user, invited_user, event, accepted_at)
    end
  end

  def self.accept_one_side(user, invited_user, event, accepted_at)
    request = find_by_user_id_and_invited_user_id_and_event_id(user.id, invited_user.id, event.id)
    request.status = 'confirmed'
    request.accepted_at = accepted_at
    request.save!
  end
end
