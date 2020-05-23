require 'json'

class School1 < Base
  def parse(string)
    @data = JSON.parse(string, symbolize_names: true)
    @students = @data
  end
end
