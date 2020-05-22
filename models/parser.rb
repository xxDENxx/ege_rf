class Parser
  def initialize(format:, variant:)
    @format = format
    @variant = variant
  end

  def parse_file(file)
    file.readlines
  end
end
