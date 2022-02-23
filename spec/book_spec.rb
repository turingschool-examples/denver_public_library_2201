require './lib/book'
require 'pry'


RSpec.describe Book do

  context 'create a book instance with attributes' do
    book = Book.new({
      author_first_name: "Harper",
      author_last_name: "Lee",
      title: "To Kill a Mockingbird",
      publication_date: "July 11, 1960"
      })

    it 'exists' do
      expect(book).to be_an_instance_of(Book)
    end

    it 'has attributes' do
      expect(book.title).to eq("To Kill a Mockingbird")
      expect(book.author).to eq("Harper Lee")
      expect(book.publication_year).to eq("1960")
    end
  end
end
