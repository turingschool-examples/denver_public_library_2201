class Author
  attr_reader :books, :add_book
  def initialize(info)
    @info = info
    @books = []
  end

  def name
    @info[:first_name] + " " + @info[:last_name]
  end

  def write(first_name = nil, last_name = nil, title, publication_date)
    book = Book.new({author_first_name: first_name, author_last_name: last_name, title: title, publication_date: publication_date})
  end

  def add_book(book)
    #was this a joke? my jane_eyre shows as a Book in pry but in the tests fails because it is an array? 
    @books << book
  end
end
