class Communicator < ApplicationRecord
  belongs_to :animal
  validates :name, :phone, presence: true
end
