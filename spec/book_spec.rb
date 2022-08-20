require_relative '../school_book'

describe 'Book' do
  context 'A book is added' do
    before(:each) do
      @book = Book.new('Harry Potter', 'J.K. Rowling')
    end

    it 'should add the title and author' do
      expect(@book.title).to eq('Harry Potter')
      expect(@book.author).to eq('J.K. Rowling')
    end

  end
end