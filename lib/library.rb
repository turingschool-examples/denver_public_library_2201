require_relative 'author'
require_relative 'book'

class Library

  attr_reader :name, :books, :authors
  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    @books.concat(author.books)
  end

  def publication_time_frame_for(author)
    sorted_books = author.books.sort_by{|index| index.publication_year}
    publication_times ={
      start: sorted_books.first.publication_year,
      end: sorted_books.last.publication_year
    }
  end

  def checkout(book)
    @books.include?(book)
  end
end
