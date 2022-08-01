class Person
    def initialize(name = "Unknown", age, parent_permission = true)
        @id
        @name
        @age
    end

    def is_of_age?
        @age >= 18
    end

    def can_use_services?
        is_of_age? || parent_permission
    end
end

# Instance vars: @id, @name, and @age.
# Constructor with name, age, and parent_permission as parameter. name and parent_permission are optional and have default values of "Unknown" and true.
# Getters for @id, @name, and @age.
# Setters for @name and @age.
# Private method is_of_age? that returns true if @age is greater or equal to 18 and false otherwise.
# Public method can_use_services? that returns true if person is of age or if they have permission from parents.