RSpec.describe Student do
  let(:math) { 4 }
  let(:russian) { 4 }
  let(:phys) { 4 }
  let(:student) { Student.new(name: 'Some name1', math: math, rus: russian, phys: phys) }

  it 'has math' do
    expect(student.math).to eq(math)
  end
  it 'has russian' do
    expect(student.russian).to eq(russian)
  end
  it 'has phys' do
    expect(student.phys).to eq(phys)
  end

  context 'good student' do
    it 'not bad' do
      expect(student.bad?).to eq(0.0)
    end
  end
  context 'bad student' do
    let(:russian) { 3 }
    it 'is bad' do
      expect(student.bad?).to eq(1.0)
    end
  end
end
