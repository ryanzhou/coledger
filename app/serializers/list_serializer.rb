class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :color, :total, :created_at, :updated_at
  def total
    MoneySerializer.new(object.total, root: false)
  end

end
