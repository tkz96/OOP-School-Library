class Person
  attr_accessor :name, :age
  attr_reader :id
  
  def initialize(name = "Unknown", age, parent_permission = true)
    @id = rand(10)
    @name = name
    @age = age
  end
  
  private def is_of_age?
    @age >= 18
  end
  
  def can_use_services?
    is_of_age? || parent_permission
  end
end
