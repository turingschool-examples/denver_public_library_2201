require 'pry'
require './lib/book'

RSpec.describe Book do
  context "Iteration 1" do
    before(:each) do
      @book = Book.new({
                        author_first_name: "Harper",
                        author_last_name: "Lee",
                        title: "To Kill a Mockingbird",
                        publication_date: "July 11, 1960"
                      })
    end

    xit 'exists' do
      expect(@book).to be_an_instance_of(Book)
    end

  end
  context "Iteration 2" do
    before(:each) do

    end

    xit ' ' do
      expect().to eq()
    end

    xit ' ' do
      expect().to eq()
    end

#     pry(main)> book.title
# #=> "To Kill a Mockingbird"

# pry(main)> book.author
# #=> "Harper Lee"

# pry(main)> book.publication_year
# #=> "1960"