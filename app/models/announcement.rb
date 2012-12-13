class Announcement
  include Mongoid::Document
  include Mongoid::Timestamps

  field :headline,   :type => String
  field :subhead,    :type => String
  field :message,    :type => String
  field :publish_time, :type => DateTime
end
