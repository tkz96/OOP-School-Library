module LoadData
  def load_books
    if File.exist?('./books.json')
      json_books = JSON.parse(File.read('./books.json'))
      books = []
      json_books.each do |book|
        books << Book.new(book['title'], book['author'])
      end
      books
    else
      File.write('./books.json', [])
    end
  end
end
