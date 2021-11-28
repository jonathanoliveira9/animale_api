class Animal < ApplicationRecord
  belongs_to :user
  has_many :communicators

  enum status: { lost: 0, communicated: 1, found: 2 }

  validates :name, :status, presence: true

  before_save :notify_changes_status, if: proc { status_changed? }

  private

  def notify_changes_status
    Animal::NotificationWorker.perform_async(id)
  end
end
