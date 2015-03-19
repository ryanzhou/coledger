class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :currency, type: String

  has_many :memberships
  belongs_to :owner, class_name: "User"

  validates :currency, inclusion: Money::Currency.all.map(&:iso_code)

  after_create :create_owner_membership

  def money_currency
    Money::Currency.wrap(self[:currency])
  end

  def create_owner_membership
    memberships.create!(user: owner, role: :admin)
  end
end
