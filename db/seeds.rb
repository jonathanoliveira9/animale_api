# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Creating Users'

10.times do |_|
  password = Faker::Internet.password
  User.create(name: Faker::Name.name,
              email: Faker::Internet.email,
              city: Faker::JapaneseMedia::OnePiece.island,
              district: Faker::JapaneseMedia::OnePiece.location,
              phone: Faker::PhoneNumber.cell_phone,
              password: password,
              password_confirmation: password)
end

puts 'Creating Animals'

User.all.each do |user|
  3.times do |_|
    user.animals.create!(
      name: Faker::JapaneseMedia::Doraemon.character,
      age: Faker::Number.non_zero_digit,
      extra_information: Faker::Lorem.paragraph_by_chars,
      status: :lost
    )
  end
end

puts 'Creating Communicators'

Animal.all.each do |animal|
  rand(1..5).times do |_|
    animal.communicators.create!(
      name: Faker::Name.name,
      phone: Faker::PhoneNumber.cell_phone,
      occurrence: Faker::Lorem.paragraph_by_chars
    )
  end
end
