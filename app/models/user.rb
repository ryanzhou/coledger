class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword
  include GlobalID::Identification

  RESET_PASS_VALIDITY_PERIOD  = 2.hours

  field :username, type: String
  field :email, type: String
  field :current_password, type: String
  field :password_digest, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :reset_token, type: String
  index({ updated_at: 1 }, { expire_after_seconds: RESET_PASS_VALIDITY_PERIOD })

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

  def assign_reset_token
    self.reset_token = SecureRandom.urlsafe_base64(32)
  end

  def reset_expires_at
    updated_at + RESET_PASS_VALIDITY_PERIOD
  end
  
end
