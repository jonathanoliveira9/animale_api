class Communicator < ApplicationRecord
  belongs_to :animal
  validates :name, :phone, :occurrence, presence: true
end
