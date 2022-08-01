class Teacher < Person
    def initialize(specialization)
        super
        @specialization = specialization
    end

    def can_use_services?
        true
    end
end

# Inherits from Person.
# Constructor extends parent's constructor by adding @specialization and a parameter for it.
# Override can_use_services? so it always returns true.