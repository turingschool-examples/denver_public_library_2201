require './lib/book'

class Author
  attr_reader :books

  def initialize(attributes)
    @attributes = attributes
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    @books = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def write(book, date)
    @book = book
    @date = date
    new_hash = {}
    new_hash[:author_first_name] = @first_name
    new_hash[:author_last_name] = @last_name
    new_hash[:title] = @book
    new_hash[:publication_date] = @date
    @new_book = Book.new(new_hash)
    @books << @new_book
    @new_book

  end
end
