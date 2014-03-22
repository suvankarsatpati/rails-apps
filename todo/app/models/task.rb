class Task
  include Mongoid::Document
  include Mongoid::Timestamps

  field :task, type: String

  
end
