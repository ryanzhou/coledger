class List
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Enum

  field :name, type: String
  enum :color, [:red, :green, :blue, :gray]

  belongs_to :account
end
