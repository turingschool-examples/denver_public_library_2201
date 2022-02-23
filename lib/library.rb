class Library
  attr_reader :name, :books, :authors
  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author_name)
    @authors << author_name
    author_name.books.each do |book|
      @books << book
    end
  end

  def publication_time_frame_for(author_name)
    time_frame = {}
    book_years = []
    author_name.books.each do |book|
      book_years << book.publication_year
    end
    book_years.sort!
    time_frame[:start] = book_years[0]
    time_frame[:end] = book_years[-1]
    time_frame
  end

  def checkout(book_name)
    if @books.include? book_name
      true
    elsif !@books.include? book_name
      false
    end
  end
end
