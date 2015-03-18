class ProjectSerializer < ActiveModel::Serializer

  attributes :id, :name, :currency, :created_at, :updated_at

end
