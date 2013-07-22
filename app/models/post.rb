class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title,           type: String
  field :author,          type: String
  field :preface,         type: String
  field :description,     type: String

  validates_presence_of   :title, :author, :preface, :description

end
