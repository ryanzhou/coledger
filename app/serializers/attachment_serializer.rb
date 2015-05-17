class AttachmentSerializer < ActiveModel::Serializer
  attributes :id, :original_filename, :size, :content_type, :expiring_url, :created_at

  def original_filename
    object.file.original_filename
  end

  def size
    object.file.size
  end

  def content_type
    object.file.content_type
  end

  def expiring_url
    object.file.expiring_url
  end
end
