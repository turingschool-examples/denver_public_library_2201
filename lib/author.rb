require './lib/book'

class Author
  attr_reader :name, :books
  def initialize(name)
    @first_name = name[:first_name]
    @last_name = name[:last_name]
    @name = "#{@first_name} #{@last_name}"
    @books = []
  end

  def write(title, date)
    book = Book.new({:title => title, :author_first_name => @first_name, :author_last_name => @last_name, :publication_date => date})
    @books << book
    book
  end
end

# require "pry"; binding.pry
