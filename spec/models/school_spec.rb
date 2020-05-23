RSpec.describe School do
  let (:good_student1) { Student.new(name: 'Some name1', math: 4, rus: 5, phys: 4) }
  let (:good_student2) { Student.new(name: 'Some name2', math: 4, rus: 4, phys: 5) }
  let (:bad_student) { Student.new(name: 'Some name3', math: 4, rus: 3, phys: 3) }
  let (:students) { [good_student1, good_student2, bad_student] }
  let (:school) {
    sch = School.new(number: 0, file_format: :json)
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
    let (:new_student) { Student.new(name: 'Some name4', math: 5, rus: 5, phys: 5) }
    subject { school.add_student(new_student) }
    it { expect { subject }.to change { school.average_math }.by(0.25) }
    it { expect { subject }.to change { school.average_russian }.by(0.25) }
    it { expect { subject }.to change { school.average_phys }.by(0.25) }
    it { expect { subject }.to change { school.bad_students } }
  end
end
