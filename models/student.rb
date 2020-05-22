class Student
  attr_accessor :math, :russian, :phys

  def initialize(math: nil, russian: nil, phys: nil)
    @math = math if math
    @russian = russian if russian
    @phys = phys if phys
  end

  def bad?
    @math <= 3 ||
    @russian <= 3 ||
    @phys <= 3 ? 1.0 : 0.0
  end
end
