class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  field :location,      :type => String
  field :title,         :type => String
  field :time,          :type => String
  field :label,         :type => String
  field :date,          :type => DateTime
  field :details,       :type => String
end
