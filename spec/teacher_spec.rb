require './school_teacher'

describe Teacher do
  it 'is an instance of Teacher Class' do
    teacher = Teacher.new( 65, 'Chidinma', 'Engineer')
    expect(teacher).to be_instance_of(Teacher)
  end

  it 'a teacher can use service regardless of age' do
    teacher = Teacher.new(65, 'Chidama', 'Engineer')
    expect(teacher.can_use_services?).to eq(true)
  end
end