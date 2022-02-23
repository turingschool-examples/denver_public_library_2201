require './lib/book'
class Author
attr_accessor :name, :books

  def initialize(attributes)
    @name = attributes[:first_name] + " " + attributes[:last_name]
    @books = []
  end

  def write(author, date)
    book = Book.new({author_first_name: author.split.first, author_last_name: author.split.last, title: author, publication_date: date})
    # @books.each {|book_element| book_element << book}
    # @books << book
    # require 'pry'; binding.pry
  end



end
