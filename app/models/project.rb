class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String

  belongs_to :user
end
