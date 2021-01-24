class RepositorySerializer
  include JSONAPI::Serializer
  attributes :name, :description, :author, :stars, :forks, :updated_at
end
