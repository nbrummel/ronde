class Event < ActiveRecord::Base

	# Associations
	has_many :invitations
	belongs_to :created_by, :class_name => 'User'
	has_many :attending_users, :through => :invitations, :source => :user, :conditions => "status = 'confirmed'"

	validates_presence_of :description, :location, :name, :start, :created_by, :end #:start_at_and_end_at
	attr_accessible :description, :end, :location, :name, :public, :start, :created_by, :event_type, :user_id, :all_day
	after_initialize :init 

	EVENT_OPTIONS = %w[food drink other]

	def init
		self.public ||= false
	end

	def new
		self.create(:description, :end, :location, :name, :public, :start, :created_by, :event_type, :user_id)
	end

	
	private

# 		def start_at_and_end_at
			
# 				if :start == :end
# 					errors.add(:start, "cannot equal the end at")
# 					errors.add(:end, "cannot equal the start at")
# 				elsif :start > :end
# 					errors.add(:start, "cannot be after the end at")
# 					errors.add(:end, "cannot be before the start at")
# 				end
# 		end
end
