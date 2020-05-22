class City
  AVERAGE_METHODS = [:average_math, :average_russian, :average_phys, :bad_students]
  attr_reader :schools
  def initialize
    @schools = []
  end

  def add_school(school)
    @schools << school
    AVERAGE_METHODS.each do |mth|
      instance_variable_set("@#{mth}", nil)
    end
  end

  AVERAGE_METHODS.each do |mth|
    define_method(mth) do
      var = instance_variable_get("@#{mth}")
      return var if var
      instance_variable_set(
        "@#{mth}",
        schools.inject([0, 0]) do |data, school|
          if school.students.count > 0
            [
              (data[0] * data[1] + school.public_send(mth) * school.students.count) / (data[1] + school.students.count),
              data[1] + school.students.count
            ]
          else
            data
          end
        end.first
      )
    end
  end
end
