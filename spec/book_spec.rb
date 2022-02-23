require 'rspec'
require './lib/book'

describe Book do
  before (:each) do
    @book = Book.new({author_first_name: "Harper", author_last_name:   "Lee", title: "To Kill a Mockingbird", publication_date: "July 11,  1960"})
  end
    describe '#initialize' do
      it 'exists' do
        expect(@book).to be_an_instance_of(Book)
      end

      it 'has a title' do
        expected = "To Kill a Mockingbird"
        actual = @book.title
        expect(actual).to eq(expected)
      end

      it 'has an author' do
        expected = "Harper Lee"
        actual = @book.author
        expect(actual).to eq(expected)
      end

      it 'has a publication year' do
        expect(@book.publication_year).to eq("1960")
      end
    end


end
