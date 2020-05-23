FactoryBot.define do
  factory :school do
    initialize_with { new(number: number, file_format: file_format) }
    sequence(:number) { |n| n }
    file_format { nil }

    trait :with_students do
      after(:build) { |school|
        school.add_student(build(:student, :good))
        school.add_student(build(:student, :good))
        school.add_student(build(:student, :bad))
      }
    end
    trait :with_bad_students do
      with_students
      after(:build) { |school|
        school.add_student(build(:student, :very_bad))
      }
    end
  end
end
