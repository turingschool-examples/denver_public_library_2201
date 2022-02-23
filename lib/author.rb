require 'pry'
require './lib/book'

class Author

  attr_reader :name, :books

  def initialize(hash)
    @auth_hash = hash
    @name = hash[:first_name] + " " + hash[:last_name]
    @books = []

  end

  def write(name, pub_date)
    book_hash = {}
    book_hash[:author_first_name] = @auth_hash[:first_name]
    book_hash[:author_last_name] = @auth_hash[:last_name]
    book_hash[:title] = name
    book_hash[:publication_date] = pub_date
    new_book = Book.new(book_hash)
    @books << new_book
    return new_book
  end

end
# binding.pry
