class CommunicatorSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :phone
  belongs_to :animal
end
