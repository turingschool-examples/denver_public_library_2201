class Author
  attr_reader :books
  def initialize(info)
    @info = info
    @books = []
  end

  def name
    @info[:first_name] + " " + @info[:last_name]
  end

  def write(title, publication_date)
    @books << Book.new({title: title, publication_date: publication_date})
    @books.last
  end
end
