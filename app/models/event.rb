class Event < ActiveRecord::Base

  # Associations
  has_many :invitations
  belongs_to :created_by, :class_name => 'User'
  has_many :attending_users, :through => :invitations, :source => :user, :conditions => "status = 'confirmed'"
  has_many :invited_users, :through => :invitations, :source => :user, :conditions => "status = 'invited'"

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
    flag['description'] = true if details[:description] == nil or details[:description] == ""
    flag['location'] = true if details[:location] == nil or details[:location] == ""
    flag['event_type'] = true if details[:event_type] == nil or details[:event_type] == ""
    return flag
  end

end
