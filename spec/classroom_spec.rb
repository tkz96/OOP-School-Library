require_relative '../school_classroom'
require_relative '../school_person'
require_relative '../school_student'

describe 'Classroom' do
  context 'Create a classroom for students' do
    before(:all) do
      @classroom = Classroom.new('A')
      @student1 = Student.new('A', 26, 'Talha', true)
      @student2 = Student.new('B', 27, 'Richard', true)
    end
    it 'should create a classroom' do
      expect(@classroom.label).to eq('A')
      expect(@classroom.students).to eq([])
    end

    it 'should add a student to a classroom' do
      @classroom.add_student(@student1)
      expect(@classroom.students).to eq([@student1])
    end

    it 'should add multiple students to a classroom' do
      @classroom.add_student(@student2)
      expect(@classroom.students).to eq([@student1, @student2])
    end
  end
end
