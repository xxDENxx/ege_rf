Dir['./models/*.rb'].each { |file| require file }
Dir['./parsers/*.rb'].each { |file| require file }

city = City.new
schools = [
  { number: 1, format: :json },
  { number: 2, format: :json },
  { number: 3, format: :xml },
]
schools.each do |school_params|
  school = School.new(
    number: school_params[:number],
    file_format: school_params[:format]
  )

  file = File.open("./data/#{school.data_file_name}")
  parser = "School#{school.number}".constantize.new
  parser.parse(file.read)
  parser.students.each do |st_params|
    student = Student.new(**st_params)
    school.add_student(student)
  end

  city.add_school(school)
end

puts 'Average Scores:'
puts "math: #{city.average_math.round(1)}, russian: #{city.average_russian.round(1)}, phys: #{city.average_phys.round(1)}"
puts "Bad-learning students percentage: #{(city.bad_students * 100).to_i}%"
