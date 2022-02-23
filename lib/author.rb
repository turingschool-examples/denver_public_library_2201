require './lib/book'
require 'pry'

class Author
  attr_reader :author_info, :books

  def initialize(author_info = {}, books = [])
    @author_info = author_info
    @books = books
  end

  def name
    "#{@author_info[:first_name]} #{@author_info[:last_name]}"
  end

  def write(title, pub_date)
    book = Book.new(title: title, publication_date: pub_date)
    @books << book
    book  
  end
  # binding.pry
end
