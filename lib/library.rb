require './lib/author'

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
    author.books.each {|book| @books << book}
  end

  def publication_time_frame(author)
    pub_dates = author.books.map {|book| book.publication_year}
    pub_span = {:start => pub_dates.sort.first, :end => pub_dates.sort.last}
  end

  def checkout(book)
    if @books.include?(book) && !@checked_out_books.include?(book)
      book.times_checked_out += 1
      @checked_out_books << book
      return true
    else
      return false
    end
  end

  def return(book)
    @checked_out_books.delete(book)
  end

  def most_popular_book
    @books.sort_by {|book| book.times_checked_out}.last
  end
end
