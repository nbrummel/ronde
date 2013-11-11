class Event < ActiveRecord::Base

	# Associations
	has_many :invitations
	belongs_to :created_by, :class_name => 'User'
	has_many :attending_users, :through => :invitations, :source => :user, :conditions => "status = 'confirmed'"

	validates_presence_of :description, :location, :name, :start, :created_by
	attr_accessible :description, :end, :location, :name, :public, :start, :created_by, :event_type, :user_id
	EVENT_OPTIONS = %w[food drink other]
	after_initialize :init 

	def init
		self.public ||= false
	end

	def self.new_event(details, user)
		@event = Event.new
		@event.created_by = user
		@flag = validate(details)
		if @flag.empty?
			@event.attributes = details
			@event.save!
		end
		return @event, @flag
	end

	def self.validate(details)
		flag = {}
		flag['name'] = true if details[:name] == nil or details[:name] == "" 
		flag['location'] = true if details[:location] == nil or details[:location] == ""
		flag['event_type'] = true if details[:event_type] == nil or details[:event_type] == ""
		flag['description'] = true if details[:description] == nil or details[:description] == ""
		t = Time.new(details['start(1i)'], details['start(2i)'], details['start(3i)'], details['start(4i)'], details['start(5i)'])
		flag['start'] = true if t < Time.now
		return flag 
	end
end