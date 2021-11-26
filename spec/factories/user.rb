FactoryBot.define do
  factory :user do
    name     { Faker::JapaneseMedia::OnePiece.character }
    email    { Faker::Internet.email }
    phone    { Faker::PhoneNumber.cell_phone }
    password { 123_456 }
    password_confirmation { 123_456 }
    city     { Faker::Fantasy::Tolkien.location }
    country    { Faker::Fantasy::Tolkien.location }
  end
end
