require './school_rental'
require './school_person'
require './school_student'
require './school_teacher'
require './school_book'
require './main'

class App
  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  # 1
  def list_books
    if @books.empty?
      puts 'Error: No books added!'
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end
    end
    Main.new.run
  end

  # 2
  def list_people
    if @people.empty?
      puts 'Error: No people added'
    else
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
    Main.new.run
  end

  # 3
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp
    case person_type
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'error'
    end
    puts "Person created successfully!\n"
    Main.new.run
  end

  # 3 (1)
  def create_student
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp

    case permission
    when 'y'
      permission = true
    when 'n'
      permission = false
    else
      puts 'error'
    end

    student = Student.new(nil, age, name, permission)
    @people.push(student)
  end

  # 3 (2)
  def create_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(age, name, specialization)
    @people.push(teacher)
  end

  # 4
  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    new_book = Book.new(title, author)
    @books.push(new_book)
    puts 'Book added successfully'

    Main.new.run
  end

  # 5
  def create_rental
    puts 'Select a book from the following list by number: '
    # list_books
    @books.map.with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_idx = gets.chomp
    puts 'Select a person from the following list by number: '
    # list_people
    @people.map.with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_idx = gets.chomp

    print 'Date(YYYY/MM/DD): '
    rental_date = gets.chomp

    rental = Rental.new(rental_date, @people[person_idx.to_i], @books[book_idx.to_i])
    @rentals.push(rental)
    puts 'Rental added successfully!'

    Main.new.run
  end

  def list_rental
    print "\nID of person: "
    person_id = gets.chomp
    @rentals.each do |rental|
      next unless rental.person.id == person_id.to_i

      puts "Title: #{rental.book.title}"
      puts "Rental Date: #{rental.date}"
      puts "Renter: #{rental.person.name}"
    end
    Main.new.run
  end
end
