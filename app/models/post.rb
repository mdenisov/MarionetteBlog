class Post
  include Mongoid::Document

  field :title,           type: String
  field :author,          type: String
  field :preface,         type: String
  field :description,     type: String

end
