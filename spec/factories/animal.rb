FactoryBot.define do
  factory :animal do
    name { Faker::JapaneseMedia::OnePiece.character }
    age  { Faker::Number.non_zero_digit }
    extra_information { Faker::Lorem.paragraph_by_chars }
    user { association :user }
  end

  trait :lost do
    status { 'lost' }
  end

  trait :communicated do
    status { 'communicated' }
  end

  trait :found do
    status { 'found' }
  end
end
