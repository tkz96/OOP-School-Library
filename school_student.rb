class Student < Person
  attr_accessor :classroom

  def initialize(classroom)
    super
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
