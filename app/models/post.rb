class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title,           type: String
  field :author,          type: String
  field :preface,         type: String
  field :description,     type: String

  has_and_belongs_to_many :tags

  default_scope order_by(created_at: :desc)

  attr_accessible :title, :author, :preface, :description, :tag_ids

  validates_presence_of   :title, :author, :preface, :description

end
