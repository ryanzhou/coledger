class Account
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Enum

  field :name, type: String
  field :archived, type: Boolean, default: false
  enum :account_type, [:income, :expense, :asset, :liability]

  validates :name, :account_type, presence: true

  belongs_to :project
  has_many :lists
  has_many :transactions

  def total
    Money.new(transactions.sum(:amount_fractional), money_currency)
  end

  def money_currency
    @money_currency ||= project.money_currency
  end
end
