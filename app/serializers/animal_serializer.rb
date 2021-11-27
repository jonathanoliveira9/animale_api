class AnimalSerializer
  include JSONAPI::Serializer
  attributes :name, :age, :extra_information, :status
  belongs_to :user
  has_many :communicators
end
