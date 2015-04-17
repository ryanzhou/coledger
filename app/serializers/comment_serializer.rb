class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user, :created_at

  def lists
    ActiveModel::ArraySerializer.new(object.lists, each_serializer: ListSerializer)
  end

  def user
    UserProfileSerializer.new(object.user, root: false)
  end
end
