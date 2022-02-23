require './lib/book'

RSpec.describe Book do

  describe 'Iteration 1' do

    it "exits" do
      book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
      expect(book).to be_an_instance_of(Book)
    end

  end


end
