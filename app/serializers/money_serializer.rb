class MoneySerializer < ActiveModel::Serializer
  attributes :decimal, :formatted, :fractional

  def fractional
    object.fractional
  end

  def decimal
    object.amount
  end

  def formatted
    object.format
  end
end
