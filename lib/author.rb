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
    title = Book.new({author_first_name: @first_name, author_last_name: @last_name, title: title, publication_date: publication_date})
    books << title
    return title
  end
end
