class Main

  @app = App.new

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
      @app.list_books
      App.new.list_books
    when '2'
      App.new.list_people
    when '3'
      App.new.create_person
    when '4'
      App.new.create_book
    when '5'
      App.new.create_rental
    when '6'
      App.new.list_rental
    else
      puts 'Good-bye.'
      exit
    end
  end
end

# entry point of the entire application
Main.new.run
