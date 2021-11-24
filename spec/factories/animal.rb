FactoryBot.define do
  factory :animal do
    name { Faker::JapaneseMedia::OnePiece.character }
    age  { Faker::Number.non_zero_digit }
    extra_information {}
    status { 0 }
    user { association :user }
  end

  trait :lost do
    status { 0 }
  end

  trait :communicated do
    status { 1 }
  end

  trait :found do
    status { 2 }
  end
end
