class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :default_currency, type: String

  validates :default_currency, inclusion: Money::Currency.all.map(&:iso_code)

  belongs_to :user

  def default_currency
    Money::Currency.wrap(self[:default_currency])
  end
end
