require './app'

def main
  books = []
  people = []
  rentals = []
  run(books, people, rentals)
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

def run(books, people, rentals)
  app = App.new
  loop do
    show_menu
    case gets.chomp
    when '1'
      app.list_books(books)
    when '2'
      app.list_people(people)
    when '3'
      app.create_person(people)
    when '4'
      app.create_book(books)
    when '5'
      app.create_rental(books, people, rentals)
    when '6'
      app.list_rental(rentals)
    else
      exit
    end
  end
end

main
