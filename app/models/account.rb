class Account
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Enum

  field :name, type: String
  enum :account_type, [:income, :expense, :asset, :liability]

  validates :name, :account_type, presence: true

  belongs_to :project
  has_many :lists
  has_many :transactions

  def total
    BigDecimal.new("0.00")  # TODO
  end

  def money_currency
    @money_currency ||= project.money_currency
  end
end
