require './lib/book'

RSpec.describe Book do

  describe 'Iteration 1' do

    it "exits" do
      book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
      expect(book).to be_an_instance_of(Book)
    end

    it "has a title" do
      book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
      expect(book.title).to eq("To Kill a Mockingbird")
    end

    xit "has a author" do
      book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
      expect(book.author).to eq(author_last_name)
    end

    xit "has a publication_year" do
      book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
      expect(book.publication_year).to eq("1960")
    end

  end


end
