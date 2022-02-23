require 'rspec'
require './lib/book'

describe Book do
  book = Book.new({
                    author_first_name: "Harper",
                    author_last_name: "Lee",
                    title: "To Kill a Mockingbird",
                    publication_date: "July 11, 1960"})
  describe 'initialization' do
    it 'has a title' do
      expect(book.title).to eq("To Kill a Mockingbird")
    end
  end
end
