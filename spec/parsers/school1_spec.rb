RSpec.describe School1 do
  let(:hash) { [
    { name: 'Some name', math: 4, rus: 4, phys: 4 },
    { name: 'Some name1', math: 3, rus: 3, phys: 3 }
  ] }
  let(:json) { hash.to_json }

  subject do
    parser = described_class.new
    parser.parse(json)
    parser.students
  end

  it 'correct parse' do
    expect(subject).to eq(hash)
  end
end
