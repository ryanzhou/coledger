class Membership
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Enum

  enum :role, [:admin, :editor, :viewer]

  belongs_to :project
  belongs_to :user
end
