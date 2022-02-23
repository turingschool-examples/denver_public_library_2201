class Book

  attr_reader :book_info

  def initialize(book_info)
    @book_info = book_info
  end

  def title
    @book_info[:title]
  end

  def author
    @book_info[:author_first_name] + " " + @book_info[:author_last_name]
  end

  def publication_year
    year = @book_info[:publication_date]
    year[-4..-1]
  end
end
