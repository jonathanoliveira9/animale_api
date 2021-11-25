class Animal::NotificationWorker
  include Sidekiq::Worker

  def perform(animal_id)
    AnimalMailer.notify_changes(animal_id).deliver
  end
end
