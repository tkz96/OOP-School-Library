require './school_book'

module StoreData
  def store_data(books)
    store_books(books)
  end

  def store_books(books)
    json_books = []
    books.each do |book|
      json_books << {
        title: book.title,
        author: book.author
      }
    end
    File.write('./books.json', JSON.generate(json_books))
  end
end
