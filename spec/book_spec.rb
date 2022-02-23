require './lib/book'
require 'pry'
require 'rspec'

RSpec.describe Book do
  let(:book) {Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})}

  describe 'iteration 1' do

    it 'exists' do

      expect(book).to be_a(Book)
    end

    it 'can read the title' do

      expect(book.title).to eq("To Kill a Mockingbird")
    end

    it 'can read the author' do

      expect(book.author).to eq("Harper Lee")
    end

    it 'can read the publication year' do

      expect(book.publication_year).to eq("1960")
    end
  end
end
