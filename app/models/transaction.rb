class Transaction
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String
  field :amount_fractional, type: Integer
  field :due_date, type: Date

  has_many :comments
  belongs_to :account
  belongs_to :list
  belongs_to :assignee, class_name: "User"

  validates :name, :amount, :account, :list_id, presence: true
  validate :list_belongs_to_account

  def money_currency
    @money_currency = account.money_currency
  end

  def amount
    Money.new(amount_fractional, money_currency)
  end

  def amount=(str)
    self.amount_fractional = (BigDecimal.new(str) * money_currency.subunit_to_unit).to_i
  end

  def list_belongs_to_account
    errors.add(:list, "does not belong to account") unless list && list.account == account
  end

  def assignee_username
    assignee.try(:username)
  end

  def assignee_username=(username)
    self.assignee = User.find_by(username: username) if username.present?
  end
end
