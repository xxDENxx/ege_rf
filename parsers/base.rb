class Base
  attr_reader :students
  def initialize
    @students = nil
    @data = nil
  end

  def parse
    raise NotImplementedError
  end

  def parsed?
    @data.present?
  end
end
