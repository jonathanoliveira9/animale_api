class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :email, :phone, :city, :country
  has_many :animals
end
