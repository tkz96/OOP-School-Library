class Student < Person
    def initialize(classroom)
        super
        @classroom = classroom
    end

    def play_hooky
        "¯\(ツ)/¯"
    end
end

# Inherits from Person.
# Constructor extends parent's constructor by adding @classroom and a parameter for it.
# Method play_hooky that returns "¯\(ツ)/¯".