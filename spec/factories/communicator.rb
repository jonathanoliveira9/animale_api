FactoryBot.define do
  factory :communicator do
    name { Faker::JapaneseMedia::OnePiece.character }
    phone    { Faker::PhoneNumber.cell_phone }
    animal { association :animal }
  end
end
