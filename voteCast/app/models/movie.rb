class Movie
  include Mongoid::Document
  field :name, type: String
  field :storyline, type: String
  field :votes, type: Integer
  field :user_id, type: String
end
