require_relative 'book'

class Author

  attr_reader :name, :books
  def initialize(details)
    @details = details
    @name = details[:first_name] + " " + details [:last_name]
    @books = []
  end

  def write(book_title, date_published)
    book_details = {
      author_first_name: @details[:first_name],
      author_last_name: @details[:last_name],
      title: book_title,
      publication_date: date_published
    }
    book = Book.new(book_details)
    @books << book
    return book
  end
end
