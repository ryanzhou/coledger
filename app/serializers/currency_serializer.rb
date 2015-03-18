class CurrencySerializer < ActiveModel::Serializer
  attributes :id, :name, :iso_code, :symbol, :select_name
  delegate :id, :name, :iso_code, :symbol, to: :object

  def select_name
    "#{object.iso_code} - #{object.name}"
  end
end
