require './lib/book'
require './lib/author'


class Library
  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @authors = []
    @books = []
  end

  def add_author(author)
    @books << author.books
    @books.flatten
    @authors << author
  end

  def publication_time_frame_for(author)
    @publication_years = []
    author.books.each do | book|
      publication_years << book.publication_year.to_i
      publication_years.sort
    end
    time_frame ={:start => @publication_years.first.to_s, :end => @publication_years.last.to_s}
    return time_frame
  end
end
