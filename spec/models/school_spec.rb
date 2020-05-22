RSpec.describe School do
  let (:good_student1) { Student.new(math: 4, russian: 5, phys: 4) }
  let (:good_student2) { Student.new(math: 4, russian: 4, phys: 5) }
  let (:bad_student) { Student.new(math: 4, russian: 3, phys: 3) }
  let (:students) { [good_student1, good_student2, bad_student] }
  let (:school) {
    sch = School.new(number: 0, parser: nil)
    students.each { |st| sch.add_student(st) }
    sch
  }

  it 'has average_math' do
    expect(school.average_math).to eq(4)
  end
  it 'has average_russian' do
    expect(school.average_russian).to eq(4)
  end
  it 'has average_phys' do
    expect(school.average_phys).to eq(4)
  end
  it 'has bad_student' do
    expect(school.bad_students).to eq(1.0 / 3)
  end

  context 'new student' do
    let (:new_student) { Student.new(math: 5, russian: 5, phys: 5) }
    subject { school.add_student(new_student) }
    it { expect { subject }.to change { school.average_math }.by(0.25) }
    it { expect { subject }.to change { school.average_russian }.by(0.25) }
    it { expect { subject }.to change { school.average_phys }.by(0.25) }
    it { expect { subject }.to change { school.bad_students } }
  end
end
