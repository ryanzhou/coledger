class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :currency, type: String

  validates :currency, inclusion: Money::Currency.all.map(&:iso_code)

  belongs_to :user

  def currency
    Money::Currency.wrap(self[:currency])
  end
end
