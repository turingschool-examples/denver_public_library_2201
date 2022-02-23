require 'pry'

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
    author.books.each do |book|
      @books << book
    end
  end

  def publication_time_frame_for(author)
    publication_years = author.books.map do |book|
      book.publication_year
    end
    earliest_year = publication_years.min
    latest_year = publication_years.max
    time_frame = {:start=>earliest_year, :end=>latest_year}
  end

  def checkout(book)
    if @checked_out_books.include?(book)
      return false
    end
    @checked_out_books << book
    @books.include?(book)
  end

  def return(book)
    @checked_out_books.delete(book)
  end
end
