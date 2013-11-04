class Event < ActiveRecord::Base

	# Associations
	has_many :invitations
	belongs_to :created_by, :class_name => 'User'
	has_many :attending_users, :through => :invitations, :source => :user, :conditions => "status = 'confirmed'"

	validates_presence_of :description, :location, :name, :start, :created_by
	attr_accessible :description, :end, :location, :name, :public, :start, :created_by, :event_type, :user_id
	after_initialize :init 

	def init
		self.public ||= false
	end
end
