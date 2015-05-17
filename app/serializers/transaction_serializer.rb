class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :amount, :due_date, :assignee, :assignee_username, :created_at, :updated_at, :list_id

  def amount
    MoneySerializer.new(object.amount, root: false)
  end

  def assignee
    UserProfileSerializer.new(object.assignee, root: false)
  end
end
