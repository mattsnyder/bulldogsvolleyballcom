class Event
  include Mongoid::Document
  include Mongoid::Timestamps
  include Icalendar


  field :location,          :type => String
  field :title,             :type => String
  field :start_datetime,    :type => DateTime
  field :end_datetime,      :type => DateTime
  field :label,             :type => String
  field :details,           :type => String

  def date
    "#{start_datetime.strftime("%a %b %d %I:%M%p")} - #{end_datetime.strftime("%I:%M%p")}"
  end

  def time
    "#{start_datetime.strftime("%I:%M%p")} - #{end_datetime.strftime("%I:%M%p")}"
  end

  scope :upcoming, lambda { where(:start_datetime.gte => DateTime.now.utc - 1.day).asc(:start_datetime).limit(30) }

  def self.ical
    calendar = Calendar.new
    all.each {|e| calendar.add_event e.to_ics }
    calendar.to_ical
  end

  def to_ics
    zone = ActiveSupport::TimeZone.new("Eastern Time (US & Canada)")
    event = Event.new
    event.dtstart((start_datetime.utc - 1.hour).strftime('%Y%m%dT%H%M%SZ'))
    event.dtend((end_datetime.utc - 1.hour).strftime('%Y%m%dT%H%M%SZ'))
    event.summary = self.title
    event.location = self.location
    event.uid = self.id.to_s
    event.url = Rails.application.routes.url_helpers.event_url(self.id, :host => "bulldogsvolleyball.com")
    event.description = self.details
    event
  end

end
