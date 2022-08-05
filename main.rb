class App
  def show_menu
    puts "\nWelcome to School Library App!\n
    Please choose an option by entering a number:
    1 - List all books
    2 - List all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given person id
    7 - Exit\n\n"
    gets.chomp
  end

  def run
    option = show_menu
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
    puts 'list_books'
    run
  end

  # 2
  def list_people
    puts 'list_people'
    run
  end

  # 3
  def create_person
    puts 'create_person'
    run
  end

  # 4
  def create_book
    puts 'create_book'
    run
  end

  # 5
  def create_rental
    puts 'create_rental'
    run
  end

  # 6
  def list_rental
    puts 'list_rental'
    run
  end
end

def main
  app = App.new
  app.run
end

main
