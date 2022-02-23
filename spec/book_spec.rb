require 'pry'
require 'rspec'
require './lib/book'

RSpec.describe Book do
  before(:all) do
    @book = Book.new({author_first_name: "Harper", author_last_name: "Lee",
          title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
  end

  describe "Object" do
    it "exists" do
      expect(@book).to be_instance_of(Book)
    end

    it "has a title" do
      expect(@book.title).to eq("To Kill a Mockingbird")
    end

    it "has an author" do
      expect(@book.author).to eq("Harper Lee")
    end

    it "has a publication year" do
      expect(@book.publication_year).to eq("1960")
    end
  end
end
