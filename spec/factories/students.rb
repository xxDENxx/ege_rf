FactoryBot.define do
  factory :student do
    initialize_with { new(name: name) }
    name { Faker::Superhero.name }
    math { Faker::Number.within(range: 2..5) }
    russian { Faker::Number.within(range: 2..5) }
    phys { Faker::Number.within(range: 2..5) }

    trait :good do
      math { Faker::Number.within(range: 4..5) }
      russian { Faker::Number.within(range: 4..5) }
      phys { Faker::Number.within(range: 4..5) }
    end

    trait :bad do
      math { Faker::Number.within(range: 1..3) }
      russian { Faker::Number.within(range: 1..3) }
      phys { Faker::Number.within(range: 1..3) }
    end

    trait :very_bad do
      math { 1 }
      russian { 1 }
      phys { 1 }
    end
  end
end
