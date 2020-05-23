RSpec.describe School do
  let (:school) { build(:school, :with_students) }

  it 'has average_math' do
    expect(school.average_math).to eq(school.students.sum(&:math).to_f / school.students.count)
  end
  it 'has average_russian' do
    expect(school.average_russian).to eq(school.students.sum(&:russian).to_f / school.students.count)
  end
  it 'has average_phys' do
    expect(school.average_phys).to eq(school.students.sum(&:phys).to_f / school.students.count)
  end
  it 'has bad_student' do
    expect(school.bad_students).to eq(school.students.sum(&:bad?).to_f / school.students.count)
  end

  context 'new student' do
    let (:new_student) { build(:student, :very_bad) }
    subject { school.add_student(new_student) }
    it { expect { subject }.to change { school.average_math } }
    it { expect { subject }.to change { school.average_russian } }
    it { expect { subject }.to change { school.average_phys } }
    it { expect { subject }.to change { school.bad_students } }
  end
end
