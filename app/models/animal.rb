class Animal < ApplicationRecord
  belongs_to :user
  has_many :communicators
end
