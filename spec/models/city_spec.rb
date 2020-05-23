RSpec.describe City do
  let (:city) { build(:city, :with_schools) }
  let (:students) { city.schools.map(&:students).flatten }

  it 'has average_math' do
    expect(city.average_math).to eq(students.sum(&:math).to_f / students.count)
  end
  it 'has average_russian' do
    expect(city.average_russian).to eq(students.sum(&:russian).to_f / students.count)
  end
  it 'has average_phys' do
    expect(city.average_phys).to eq(students.sum(&:phys).to_f / students.count)
  end
  it 'has bad_student' do
    expect(city.bad_students).to eq(students.sum(&:bad?).to_f / students.count)
  end

  context 'new school' do
    let(:bad_school) { build(:school, :with_bad_students) }
    subject { city.add_school(bad_school) }
    it { expect { subject }.to change { city.average_math } }
    it { expect { subject }.to change { city.average_russian } }
    it { expect { subject }.to change { city.average_phys } }
    it { expect { subject }.to change { city.bad_students } }
  end
end
