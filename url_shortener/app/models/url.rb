class Url
  include Mongoid::Document
  field :long_url, type: String
  field :short_url, type: String
end
