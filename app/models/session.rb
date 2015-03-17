class Session
  include Mongoid::Document
  include Mongoid::Timestamps

  VALIDITY_PERIOD = 15.minutes

  field :token, type: String
  index({ updated_at: 1 }, { expire_after_seconds: VALIDITY_PERIOD })

  belongs_to :user

  before_create :assign_token

  def assign_token
    self.token = SecureRandom.urlsafe_base64(32)
  end

  def expires_at
    updated_at + VALIDITY_PERIOD
  end
end
