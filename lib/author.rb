require 'pry'
require './lib/book'

class Author

  attr_reader :first_name,
              :last_name

  def initialize(data)
    @first_name = data[:first_name]
    @last_name  = data[:last_name]
    @books = []
  end

  def name
    return "#{@first_name} #{@last_name}"
  end

  def books
    return @books
  end

  def write(book_name, publication_date)
#    puts "in write #{book_name} #{publication_date}"
    bname = book_name
    pdate = publication_date
    book_data = { first_name: @first_name,
                  last_name: @last_name,
                  title: bname,
                  publication_date: pdate
    }
    book = Book.new(book_data)
    @books << book

    return book
  end


end
