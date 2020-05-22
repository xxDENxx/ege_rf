class School
  AVERAGE_METHODS = {
    average_math: :math,
    average_russian: :russian,
    average_phys: :phys,
    bad_students: :bad?
  }
  attr_reader :number, :parser, :students

  def initialize(number:, parser:)
    @number = number
    @parser = parser
    @students = []
  end

  def add_student(student)
    @students << student
    AVERAGE_METHODS.each do |mth, _|
      instance_variable_set("@#{mth}", nil)
    end
  end

  AVERAGE_METHODS.each do |mth, call_method|
    define_method(mth) do
      var = instance_variable_get("@#{mth}")
      return var if var
      instance_variable_set(
        "@#{mth}",
        students.inject(0) do |sum, student|
          sum + student.public_send(call_method)
        end.to_f / students.count
      )
    end
  end
end
