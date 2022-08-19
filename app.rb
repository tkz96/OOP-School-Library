require './school_rental'
require './school_person'
require './school_student'
require './school_teacher'
require './school_book'
require './json'
class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
    @books_data = './json/books.json'
    @people_data = './json/people.json'
    @rental_data = './json/rentals.json'
    load_data
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
  end

  # 5
  def create_rental
    puts 'Select a book from the following list by number: '
    # list_books
    list_books
    book_idx = gets.chomp
    puts 'Select a person from the following list by number: '
    # list_people
    list_people
    person_idx = gets.chomp

    print 'Date(YYYY/MM/DD): '
    rental_date = gets.chomp

    rental = Rental.new(rental_date, @people[person_idx.to_i], @books[book_idx.to_i])
    @rentals.push(rental)
    puts 'Rental added successfully!'
  end
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
end

def save_data
  save_books
  save_people
  save_rentals
end

def load_data
  load_books
  load_people
  load_rentals
end

def load_books
  return if File.exist?(books_data)

  File.empty?(books_data)
  puts 'no available data'

  books = JSON.parse(File.read(books_data))
  books.each do |book|
    book = Book.new(book['title'], book['author'])
    @books << book
  end
end

def load_people
  return if File.exist?(people_data)

  File.empty?(people_data)
  puts 'no available data'

  people = JSON.parse(File.read(people_data))
  people.each do |person|
    person_info = if person.is_a?(Student)
                    Student.new(person['classroom'], person['age'], person['name'], person['parent_permission'])
                  else
                    Teacher.new(person['specialization'], person['age'], person['name'], person['parent_permission'])
                  end
    @people << person_info
  end
end

def load_rentals
  return if File.exist?(rental_data)

  File.empty?(rental_data)
  puts 'no available data'

  rental_info = JSON.parse(File.read(people_data))
  rental_info.each do |rental|
    Rental.new(rental['date'], @people[rental['person']], @books[rental['book']])
  end
end

def save_books
  books_info = []
  @books.each do |book|
    books_info << { title: book.title, author: book.author }
  end
  File.new(@books_data, 'w') if File.exist?(@books_data)
  File.write(@books_data, JSON.generate(books_info))
end

def save_people
  people_info = []
  @people.each do |person|
    people_info << if person.is_a?(Teacher)
                     { specialization: person.specialization, age: person.age, name: person.name,
                       parent_permission: true }
                   else
                     { classroom: person.classroom, age: person.age, name: person.name,
                       parent_permission: person.parent_permission }
                   end
  end
  File.new(@people_data, 'w+') if File.exist?(@people_path)
  File.write(@people_data, JSON.generate(people_info))
end

def save_rentals
  rentals_info = []
  @rentals.each do |rental|
    rentals_info << { date: rental.date, book: rental.person.title, people: rental.book.name }
  end
  File.new(@rentals_data, 'w+') if File.exist?(@rentals_data)
  File.write(@rentals_data, JSON.generate(rentals_info))
end
