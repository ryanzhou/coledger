class AccountSerializer < ActiveModel::Serializer
  attributes :id, :name, :account_type, :total, :created_at, :updated_at
end
