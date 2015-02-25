class Url
  include Mongoid::Document
  field :long_url, type: String
  field :short_url, type: String
  field :usage_frequency, type: Integer
  validates :long_url, presence: true 
end
