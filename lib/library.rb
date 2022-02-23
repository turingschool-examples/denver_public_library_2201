class Library
  attr_reader :name, :books, :authors, :checked_out_books

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
  end

  def add_author(author)
    @authors << author
    @books << author.books
    @books.flatten!
  end

  def publication_time_frame_for(author)
    books_by_year = author.books.sort_by {|book| book.publication_year}
    time_frame = {}
    time_frame[:start] = books_by_year.first.publication_year
    time_frame[:end] = books_by_year.last.publication_year
    time_frame
  end

  def checkout(book)
    if @books.include?(book) && !@checked_out_books.include?(book)
      @checked_out_books << book
      book.checkout_counter += 1
      true
    else
      false
    end
  end

  def return(book)
    @checked_out_books.delete(book)
  end

  def most_popular_book
    @books.sort_by! {|book| book.checkout_counter}
    @books.last
  end
end
