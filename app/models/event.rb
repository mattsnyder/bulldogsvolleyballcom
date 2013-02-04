class Event
  include Mongoid::Document
  include Mongoid::Timestamps
  include Icalendar


  field :location,      :type => String
  field :title,         :type => String
  field :time,          :type => String
  field :start_datetime,    :type => DateTime
  field :end_datetime,      :type => DateTime
  field :label,         :type => String
  field :date,          :type => DateTime
  field :details,       :type => String

  scope :upcoming, lambda { where(:date.gte => DateTime.now.utc).asc(:date).limit(15) }

  def self.ical
    calendar = Calendar.new
    all.each {|e| calendar.add_event e.to_ics }
    calendar.to_ical
  end

  def to_ics
    event = Event.new
    event.dtstart ics_start_datetime
    event.dtend ics_end_datetime
    event.summary = self.title
    event.location = self.location
    event.uid = self.id.to_s
    event.url = Rails.application.routes.url_helpers.event_url(self.id, :host => "bulldogsvolleyball.com")
    event.description = self.details
    event
  end

  def ics_start_datetime
    return "" unless self.start_datetime
    self.class.ics_datetime(self.start_datetime) # Note: utc_start_datetime should be different than the local time of the event
  end

  def ics_end_datetime
    return "" unless self.end_datetime
    self.class.ics_datetime(self.end_datetime) # Note: utc_end_datetime should be different than the local time of the event
  end

  def self.ics_datetime(utc_time_obj)
    utc_time_obj.strftime('%Y%m%dT%H%M%SZ')
  end
end
