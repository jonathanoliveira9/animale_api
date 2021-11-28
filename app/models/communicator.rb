class Communicator < ApplicationRecord
  belongs_to :animal
  validates :name, :phone, :occurrence, presence: true
  scope :by_animal, ->(id) { where(animal_id: id) }
end
