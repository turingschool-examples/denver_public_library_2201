require './lib/book'

class Author
  attr_reader :name, :books

  def initialize(info)
    @name = "#{info[:first_name]} #{info[:last_name]}"
    @first_name = info[:first_name]
    @last_name = info[:last_name]
    @books = []
  end

  def write(title, publication_date)
    @books << Book.new({author_first_name: @first_name, author_last_name: @last_name, title: title, publication_date: publication_date})
    @books.last
  end
end
