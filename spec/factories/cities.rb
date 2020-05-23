FactoryBot.define do
  factory :city do
    trait :with_schools do
      after(:build) { |city|
        city.add_school(build(:school, :with_students))
        city.add_school(build(:school, :with_students))
        city.add_school(build(:school, :with_students))
      }
    end
  end
end
