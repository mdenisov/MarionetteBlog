class Tag
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name,            type: String

  has_and_belongs_to_many :posts

  default_scope order_by(created_at: :desc)

  validates_presence_of   :name
end
