class CommunicatorSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :phone, :occurrence
  belongs_to :animal
end
