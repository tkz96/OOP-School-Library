require 'json'
require './app'
require './write_data'

class Start
  include WriteData

  def initialize
    @app = App.new
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

  def options
    case gets.chomp
    when '1'
      @app.list_books
    when '2'
      @app.list_people
    when '3'
      @app.create_person
    when '4'
      @app.create_book
    when '5'
      @app.create_rental
    when '6'
      @app.list_rental
    else
      write_data(@app.books, @app.people, @app.rentals)
      puts 'Good bye!'
      exit
    end
  end

  def run
    loop do
      show_menu
      options
    end
  end
end
