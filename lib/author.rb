require './lib/book'
class Author
attr_reader :name, :books

  def initialize(attributes)
    @name = attributes[:first_name] + " " + attributes[:last_name]
    @books = []
  end

  def write(author, date)
    book = Book.new({author_first_name: author.split.first, author_last_name: author.split.last, publication_date: date})

  end

end
