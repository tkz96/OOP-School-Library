require './school_book'

describe Book do
  it 'has a title' do
    book = Book.new('Harry Potter', 'J.K. Rowling')
    expect(book.title).to eq('Harry Potter')
  end
  it 'has a author' do
    book = Book.new('Harry Potter', 'J.K. Rowling')
    expect(book.author).to eq('J.K. Rowling')
  end
end
