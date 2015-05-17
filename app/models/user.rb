class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword
  include GlobalID::Identification


  field :username, type: String
  field :email, type: String
  field :current_password, type: String
  field :password_digest, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :reset_token, type: String
  field :reset_sent_at, type: Time
  field :activated, type: Boolean
  field :activate_token, type: String
  field :activate_sent_at, type: Time
  

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
    self.reset_sent_at = Time.zone.now
    self.save
  end

  def reset_token_expired?
    time_now = Time.zone.now
    reset_sent_at + 2.hours < time_now
  end

  def assign_activate_token
    self.activated = false
    self.activate_token = SecureRandom.urlsafe_base64
    self.activate_sent_at = Time.zone.now
    self.save
  end

  def activate_token_expired?
    time_now = Time.zone.now
    activate_sent_at + 3.hours <time_now
  end
  
end
