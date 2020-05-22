RSpec.describe City do
  let (:good_student1) { Student.new(math: 4, russian: 5, phys: 4) }
  let (:good_student2) { Student.new(math: 4, russian: 4, phys: 5) }
  let (:good_student3) { Student.new(math: 5, russian: 4, phys: 4) }
  let (:good_student4) { Student.new(math: 5, russian: 5, phys: 5) }
  let (:bad_student1) { Student.new(math: 4, russian: 3, phys: 4) }
  let (:bad_student2) { Student.new(math: 4, russian: 4, phys: 3) }
  let (:bad_student3) { Student.new(math: 3, russian: 4, phys: 4) }
  let (:students1) { [good_student1, good_student2, bad_student1] }
  let (:students2) { [good_student3, good_student4] }
  let (:students3) { [bad_student2, bad_student3] }
  let (:school1) {
    sch = School.new(number: 0, parser: nil)
    students1.each { |st| sch.add_student(st) }
    sch
  }
  let (:school2) {
    sch = School.new(number: 1, parser: nil)
    students2.each { |st| sch.add_student(st) }
    sch
  }
  let (:school3) {
    sch = School.new(number: 2, parser: nil)
    students3.each { |st| sch.add_student(st) }
    sch
  }
  let (:city) {
    city = City.new
    city.add_school(school1)
    city.add_school(school2)
    city
  }

  it 'has average_math' do
    expect(city.average_math).to eq(4.4)
  end
  it 'has average_russian' do
    expect(city.average_russian).to eq(4.2)
  end
  it 'has average_phys' do
    expect(city.average_phys).to eq(4.4)
  end
  it 'has bad_student' do
    expect(city.bad_students).to eq(1.0 / 5)
  end

  context 'new school' do
    subject { city.add_school(school3) }
    it { expect { subject }.to change { city.average_math } }
    it { expect { subject }.to change { city.average_russian } }
    it { expect { subject }.to change { city.average_phys } }
    it { expect { subject }.to change { city.bad_students } }
  end
end
