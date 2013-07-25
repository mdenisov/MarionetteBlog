class Tag
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name,            type: String

  validates_presence_of   :name
end
