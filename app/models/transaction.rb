class Transaction
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String
  field :amount_fractional, type: Integer

  belongs_to :account
  belongs_to :list

  validates :name, :amount, presence: true
  validates :list_id, inclusion: account.lists.pluck(:id).map(&:to_s)

  def money_currency
    @money_currency = account.project.money_currency
  end

  def amount
    Money.new(amount_fractional, money_currency)
  end

  def amount=(decimal)
    self.amount_fractional = (decimal * money_currency.subunit_to_unit).to_i
  end
end
