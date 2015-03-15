class SessionSerializer < ActiveModel::Serializer

  attributes :id, :token, :expires_at

end
