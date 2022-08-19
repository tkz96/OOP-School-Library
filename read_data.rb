module ReadData
  def read_books
    books = []
    if File.exist?('./books.json')
      json_books = JSON.parse(File.read('./books.json'))
      json_books.each do |book|
        books << Book.new(book['title'], book['author'])
      end
    else
      File.write('./books.json', [])
    end
    books
  end

  def read_people
    persons = []
    if File.exist?('./people.json')
      json_people = JSON.parse(File.read('./people.json'))
      json_people.each do |person|
        persons <<
          case person['json_class']
          when 'Student'
            Student.new(nil, person['age'], person['name'], parent_permission: person['parent_permission'])
          when 'Teacher'
            Teacher.new(person['age'], person['name'], person['specialization'])
          end
      end
    else
      File.write('./people.json', [])
    end
    persons
  end

  def read_rentals(persons, books)
    rentals = []
    if File.exist?('./rentals.json')
      json_rentals = JSON.parse(File.read('./rentals.json'))
      json_rentals.each do |rental|
        rentals << Rental.new(
          rental['date'],
          persons.find do |person|
            person.name == rental['name']
          end,
          books.find do |book|
            book.title == rental['title']
          end
        )
      end
    else
      File.write('./rentals.json', [])
    end
    rentals
  end
end
