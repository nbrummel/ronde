class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  phone_regexp = /^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$/
  
  # To ensure certain fields arent blank or nonsense
  validates_presence_of :first_name, :last_name
  validates :phone_number, format: { with: phone_regexp }, :allow_blank => true

  # Associations with Events.
  has_many :invitations # invitations sent out by me

  # Associations with Friends (friend requests: accepted, pending, requested)
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :pending_friends, :through => :friendships, :source => :friend, :conditions => "status = 'pending'"
  has_many :accepted_friends, :through => :friendships, :source => :friend, :conditions => "status = 'accepted'"
  has_many :requested_friends, :through => :friendships, :source => :friend, :conditions => "status = 'requested'"

  # Stuff for Devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, 
                  :remember_me, :phone_number, :first_name, :last_name, 
                  :provider, :uid, :attending

  # list all of the events i have ever created
  # def my_events
  #   Event.find(:all, :conditions => ["created_by_id = ?", self.id])
  # end

  # # list all of the events i have ever created or joined               
  # def all_events
  #   [Event.find(:all, :conditions => ["created_by_id = ?", self.id]), self.joined_events].flatten.sort_by &:start
  # end

  # # list all of the events ive ever confirmed
  # def joined_events
  #   events = []
  #   invites = Invitation.find(:all, :conditions => ['invited_user_id = ? AND status = "confirmed"', self.id])
  #   invites.each { |invite| events << invite.event unless invite.event == events.last}
  #   events
  # end

  # # list all of the events Ive been invited to ever
  # def invited_events
  #   events = []
  #   invites = Invitation.find(:all, :conditions => ['invited_user_id = ? AND status = "invited"', self.id])
  #   invites.each { |invite| events << invite.event}
  #   events
  # end

  # Handles User creation for facebook login. Gets called from controller.
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:email => auth.info.email).first
    unless user
      user = User.create!(
        first_name: auth.extra.raw_info.first_name,
			  last_name: auth.extra.raw_info.last_name,
				phone_number: auth.extra.raw_info.sms.to_s,
        provider: auth.provider,
        uid: auth.uid,
        email: auth.info.email,
        password:Devise.friendly_token[8,20])
    end
    user
  end

  # Handles User creation for Google login. Gets called from controller.
  def self.find_for_google(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      user = User.create!(
        first_name: data["name"].split.first,
    		last_name: data["name"].split.last,
  		  email: data["email"],
  		  provider:access_token.provider,
  		  uid:access_token.uid,
  		  password: Devise.friendly_token[8,20])
    end
    user
	end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end	

end
