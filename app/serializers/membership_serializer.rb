class MembershipSerializer < ActiveModel::Serializer
  attributes :id, :role, :user

  def user
    UserProfileSerializer.new(object.user, root: false)
  end
end
