require './school_book'
require './school_student'
require './school_teacher'
require './school_rental'

module WriteData
  def write_data(books, people, rentals)
    write_books(books)
    write_people(people)
    write_rentals(rentals)
  end

  def write_books(books)
    json_books = []
    books.each do |book|
      json_books << {
        title: book.title,
        author: book.author
      }
    end
    File.write('./books.json', JSON.generate(json_books))
  end

  def write_people(people)
    json_people = []
    people.each do |person|
      json_people << if person.instance_of? Student
                       {
                         json_class: 'Student',
                         id: person.id, name: person.name, age: person.age
                       }
                     elsif person.instance_of? Teacher
                       {
                         json_class: 'Teacher',
                         id: person.id, name: person.name, age: person.age
                       }
                     end
    end
    File.write('./people.json', JSON.generate(json_people))
  end

  def write_rentals(rentals)
    json_rentals = []
    rentals.each do |rental|
      json_rentals << {
        date: rental.date,
        id: rental.people.id,
        title: rental.book.title,
        author: rental.book.author
      }
    end
    File.write('./rentals.json', JSON.generate(json_rentals))
  end
end
