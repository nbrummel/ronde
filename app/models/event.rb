class Event < ActiveRecord::Base
	belongs_to :user, class_name: 'User', foreign_key: 'user_id'
	has_many :invitations
	has_many :attendees, :through => :invitations, :source => :friend

	validates_presence_of :description, :location, :name, :start
	attr_accessible :description, :end, :location, :name, :public, :start
	after_initialize :init 

	def init
		self.public ||= false
	end
end
