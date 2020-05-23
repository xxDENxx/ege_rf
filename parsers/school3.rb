require 'active_support/core_ext'

class School3 < Base
  def parse(string)
    @data = Hash.from_xml(string).deep_symbolize_keys
    @students = format_data
  end

  private

  def format_data
    @data[:root][:row].map do |params|
      student = { name: params[:name] }
      params[:grades].each do |grade|
        student[grade[:subject].to_sym] = grade[:score].to_f
      end
      student
    end
  end
end
