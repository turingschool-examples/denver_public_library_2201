require './lib/book'

class Author
  attr_reader :name, :books

  def initialize(writer)
    @first_name = writer[:first_name]
    @last_name = writer[:last_name]
    @name = "#{@first_name} #{@last_name}"
    @books = []
  end

  def write (title, publication_date)
    title = Book.new({author_first_name: @first_name, author_last_name: @last_name, title: title, publication_date: publication_date})
    books << title
    return title
  end

end
