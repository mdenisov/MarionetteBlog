attributes :id, :title, :author, :preface, :description

child(:tags) do
  attributes :id, :name
end
