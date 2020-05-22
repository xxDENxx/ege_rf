Dir['./models/*.rb'].each { |file| require file }

city = City.new
schools = [
  { number: 1, parser: { format: :json, variant: 1 } },
  { number: 2, parser: { format: :json, variant: 2 } },
  { number: 3, parser: { format: :xml,  variant: 1 } },
]
schools.each do |school_params|
  parser = Parser.new(school_params[:parser])
  school = School.new(
    number: school_params[:number],
    parser: parser
  )
  city.add_school(school)
end

puts 'Average Scores:'
puts "math: #{city.average_math}, russian: #{city.average_russian}, phys: #{city.average_phys}"
puts "Bad-learning students percentage: #{city.bad_students}%"
