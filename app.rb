class App
  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def show_menu
    puts "Welcome to School Library App!\n\n"
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts "7 - Exit\n\n"
  end

  def run
    show_menu
    option = gets.chomp

    case option
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rental
    else
      puts 'Good-bye.'
      exit
    end
  end

  # 1
  def list_books
    @people.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      run
    end
  end

  # 2
  def list_people
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
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
    end
    puts "Person created successfully!\n"
    gets
    run
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
    end

    student = Student.new(age, name, permission, nil)
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

    teacher = Teacher.new(age, name, nil, specialization)
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

    run
  end

  # 5
  def create_rental
    puts 'Select a book from the following list by number: '
    list_books
    book_idx = gets.chomp

    puts 'Select a person from the following list by number: '
    list_people
    person_idx = gets.chomp

    print 'Date(YYYY/MM/DD): '
    rental_date = gets.chomp

    rental = Rental.new(rental_date, @books[book_idx.to_i], @people[person_idx.to_i])
    @rentals.push(rental)
    puts 'Rental added successfully!'

    run
  end

  # 6
  def list_rental
    obj = nil
    print "\nID of person: "
    person_id = gets.chomp

    @people.each do |n|
      obj = n if n.id == person_id.to_i
    end

    obj.rentals.each do |n|
      puts n.date
    end

    puts
    run
  end
end

def main
  app = App.new
  app.run
end

main
