require './lib/author'

class Library
  attr_reader :name, :books, :authors
  attr_accessor :author, :book
  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
  end

  def add_books
    @authors.map do |author|
    author.books
      @books << book
      
    end
  end
end
