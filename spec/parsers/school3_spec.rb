RSpec.describe School3 do
  let(:hash) { [
    { name: 'Some name', math: 4, rus: 4, phys: 4 },
    { name: 'Some name1', math: 3, rus: 3, phys: 3 }
  ] }
  let(:xml) {
    students = hash.map do |student|
      <<~XML
        <row>
          <name>#{student[:name]}</name>
          <grades>
            <subject>math</subject>
            <score>#{student[:math]}</score>
          </grades>
          <grades>
            <subject>rus</subject>
            <score>#{student[:rus]}</score>
          </grades>
          <grades>
            <subject>phys</subject>
            <score>#{student[:phys]}</score>
          </grades>
        </row>
      XML
    end
    "<root>#{students.join}</root>"
  }

  subject do
    parser = described_class.new
    parser.parse(xml)
    parser.students
  end

  it 'correct parse' do
    expect(subject).to eq(hash)
  end
end
