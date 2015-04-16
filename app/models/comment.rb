class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, type: String

  belongs_to :user
  belongs_to :transaction
end
