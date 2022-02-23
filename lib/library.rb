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
end
