class Event < ActiveRecord::Base

  # Associations
  has_many :invitations
  belongs_to :created_by, :class_name => 'User'
  has_many :attending_users, :through => :invitations, :source => :invited_user, :conditions => "status = 'confirmed'"
  has_many :invited_users, :through => :invitations, :source => :invited_user, :conditions => "status = 'invited'"

  validates_presence_of :description, :location, :name, :start, :created_by
  attr_accessible :description, :end, :location, :name, :public, :start, :created_by, :event_type, :user_id
  EVENT_OPTIONS = %w[food drink other]
  after_initialize :init

  def init
    self.public ||= false
  end

  def new
    @event = Event.new
    @event.created_by = user
  end
  def self.new_event(details, user)
    @event = Event.new
    @event.created_by = user
    @flag = validate(details)
    if @flag.empty?
      @event.attributes = details
      if details['public']
        @event.public = true
      end
      @event.start = self.get_date('start', details)
      @event.end = self.get_date('end', details)
      @event.save!
    end
    return @event, @flag
  end

  def self.get_date(epoch, details)
    start_time = details[epoch].split(' ')
    ydm = start_time[2].split('-')
    hm = start_time[0].split(':')
    hm[0] = (hm[0].to_i + 12).to_s if start_time[1] == 'PM'
    return Time.new(ydm[0].to_s, ydm[2].to_s, ydm[1].to_s, hm[0].to_s, hm[1].to_s)
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
