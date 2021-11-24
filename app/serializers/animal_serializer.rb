class AnimalSerializer
  include JSONAPI::Serializer
  attributes :name, :age, :extra_information, :status
end
