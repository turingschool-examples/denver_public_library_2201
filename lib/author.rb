require './lib/book'

class Author
  attr_reader :name, :books

  def initialize(name)
    @name = name
    @books = []
  end

  def name
    return @name[:first_name] + " " + @name[:last_name]
  end

  def write(title, publication_date)
    new_book = Book.new({author_first_name: @name[:first_name], author_last_name: @name[:last_name], title: title, publication_date: publication_date})
    books << new_book
    return new_book
  end
end