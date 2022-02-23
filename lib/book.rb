class Book
  attr_reader :book_info

  def initialize(book_info)
    @book_info = book_info
  end

  def title
    return book_info[:title]
  end

  def author
    return "#{book_info[:author_first_name]} #{book_info[:author_last_name]}"
  end

  def publication_year
    split_date = book_info[:publication_date].split(" ")
    return split_date[-1]
  end
end