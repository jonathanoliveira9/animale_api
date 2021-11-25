require 'rails_helper'

RSpec.describe Animal::NotificationWorker, type: :worker do
  it 'enqueues the notification worker' do
    animal = create(:animal)
    expect {
      Animal::NotificationWorker.perform_async(animal.id)
    }.to change { Sidekiq::Worker.jobs.size }.by(1)
  end
end
