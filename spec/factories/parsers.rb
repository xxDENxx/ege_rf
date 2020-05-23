FactoryBot.define do
  factory :parser_data, class: Hash do
    check_data {
      [
        {
          name: Faker::Superhero.name,
          math: Faker::Number.within(range: 2..5),
          rus: Faker::Number.within(range: 2..5),
          phys: Faker::Number.within(range: 2..5)
        }, {
          name: Faker::Superhero.name,
          math: Faker::Number.within(range: 2..5),
          rus: Faker::Number.within(range: 2..5),
          phys: Faker::Number.within(range: 2..5)
        }
      ]
    }
    trait :school1 do
      formatted { check_data.to_json }
    end
    trait :school2 do
      formatted {
        data = {}
        { math: :mathematics, rus: :russian_language, phys: :physics }.each do |subject, name|
          data[name] = []
          check_data.each { |st| data[name] << { student: st[:name], grade: st[subject] } }
        end
        data.to_json
      }
    end
    trait :school3 do
      formatted {
        students = check_data.map do |student|
          <<~XML
            <row>
              <name>#{student[:name]}</name>
              <grades>
                <subject>math</subject>
                <score>#{student[:math]}</score>
              </grades>
              <grades>
                <subject>rus</subject>
                <score>#{student[:rus]}</score>
              </grades>
              <grades>
                <subject>phys</subject>
                <score>#{student[:phys]}</score>
              </grades>
            </row>
          XML
        end
        "<root>#{students.join}</root>"
      }
    end

    initialize_with { attributes }
  end
end
