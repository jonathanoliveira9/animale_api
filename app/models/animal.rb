class Animal < ApplicationRecord
  belongs_to :user
  has_many :communicators

  enum status: { lost: 0, communicated: 1, found: 2 }

  validates :name, :status, presence: true
end
