class ProjectSerializer < ActiveModel::Serializer

  attributes :id, :name, :description, :currency, :memberships, :created_at, :updated_at

  def currency
    CurrencySerializer.new(object.money_currency, root: false)
  end

  def memberships
    ActiveModel::ArraySerializer.new(object.memberships, each_serializer: MembershipSerializer)
  end
end
