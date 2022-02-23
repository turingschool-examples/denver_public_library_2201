class Library
  attr_accessor :name, :books, :authors
  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    authors.push(author)
    books.push(author.books)
    books.flatten
  end


end
