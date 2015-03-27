class Membership
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Enum

  enum :role, [:admin, :editor, :viewer]

  belongs_to :project
  belongs_to :user

  scope :editing, -> { any_of({ role: :editor }, { role: :admin }) }

  validates :user, uniqueness: { scope: :project }
end
