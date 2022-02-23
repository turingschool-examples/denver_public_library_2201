require 'pry'
require './lib/book'

RSpec.describe Book do
  context 'Iteration 1' do
    before(:each) do
      @book = Book.new({
                         author_first_name: 'Harper',
                         author_last_name: 'Lee',
                         title: 'To Kill a Mockingbird',
                         publication_date: 'July 11, 1960'
                       })
    end

    it 'exists' do
      expect(@book).to be_an_instance_of(Book)
    end

    it 'has attributes' do
      expect(@book.title).to eq('To Kill a Mockingbird')
      expect(@book.author).to eq('Harper Lee')
    end

    it 'can tell the publication year' do
      expect(@book.publication_year).to eq('1960')
    end
  end
end

#     pry(main)> book.title
# #=> "To Kill a Mockingbird"

# pry(main)> book.author
# #=>

# pry(main)> book.publication_year
# #=> "1960"
