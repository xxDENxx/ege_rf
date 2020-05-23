RSpec.describe School1 do
  let(:data) { build(:parser_data, :school1) }

  subject do
    parser = described_class.new
    parser.parse(data[:formatted])
    parser.students
  end

  it 'correct parse' do
    expect(subject).to eq(data[:check_data])
  end
end
