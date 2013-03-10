class Newspaper
  include Mongoid::Document
  include Mongoid::Timestamps

  field :email_address, :type => String
  field :description,   :type => String
  field :county,        :type => String
end
