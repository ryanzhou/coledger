class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  field :username, type: String
  field :email, type: String
  field :password_digest, type: String
  field :first_name, type: String
  field :last_name, type: String

  has_secure_password

  has_many :sessions
  has_many :memberships

  validates :username, uniqueness: true, presence: true, length: { within: 3..64 }
  validates :password, length: { within: 6..256 }, allow_nil: true
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\z/i }
  validates :first_name, presence: true

  def projects
    memberships.map(&:project)
  end
end
