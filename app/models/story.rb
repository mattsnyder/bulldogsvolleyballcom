class Story
  include Mongoid::Document
  include Mongoid::Timestamps

  field :headline,         :type => String
  field :body,             :type => String
  field :author,           :type => String
  field :publication_date, :type => DateTime
  field :teaser,           :type => String

  
end
