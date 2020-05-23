require 'json'

class School2 < Base
  def parse(string)
    @data = JSON.parse(string, symbolize_names: true)
    @students = format_data
  end

  private

  def format_data
    students = {}
    @data.each do |subject, grades|
      grades.each do |grade|
        students[grade[:student]] ||= { name: grade[:student] }
        students[grade[:student]][transform_subjects(subject)] = grade[:grade]
      end
    end
    students.values
  end

  def transform_subjects(subject)
    case subject
    when :mathematics
      :math
    when :russian_language
      :rus
    when :physics
      :phys
    else
      subject
    end
  end
end
