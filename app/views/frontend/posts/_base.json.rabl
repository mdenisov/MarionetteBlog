attributes :id, :title, :author, :preface, :description, :created_at

child(:tags) do
  attributes :id, :name
end
