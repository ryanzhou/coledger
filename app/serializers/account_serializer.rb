class AccountSerializer < ActiveModel::Serializer
  attributes :id, :name, :account_type, :total, :lists, :created_at, :updated_at

  def lists
    ActiveModel::ArraySerializer.new(object.lists, each_serializer: ListSerializer)
  end
end
