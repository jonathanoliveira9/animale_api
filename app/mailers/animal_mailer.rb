class AnimalMailer < ApplicationMailer
  default from: 'animale@test.com'

  def notify_changes(animal_id)
    @animal = Animal.where(id: animal_id).last
    @user = @animal.user
    @communicator = @animal.communicators.last
    mail(to: @user.email,
         subject: 'Novas atualizações de seu animal')
  end
end
