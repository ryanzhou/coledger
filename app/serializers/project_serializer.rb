class ProjectSerializer < ActiveModel::Serializer

  attributes :id, :name, :default_currency, :created_at, :updated_at

end
