class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :email, :phone, :city, :district
  has_many :animals
end
