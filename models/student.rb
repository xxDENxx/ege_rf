class Student
  attr_reader :name
  attr_accessor :math, :russian, :phys

  def initialize(name:, math: nil, rus: nil, phys: nil)
    @name = name
    @math = math.to_f if math
    @russian = rus.to_f if rus
    @phys = phys.to_f if phys
  end

  def bad?
    @math <= 3 ||
    @russian <= 3 ||
    @phys <= 3 ? 1.0 : 0.0
  end
end
