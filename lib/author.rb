class Author

attr_reader :name, :books, :first_name, :last_name
  def initialize(author)

    @books = []
    @first_name = author[:first_name]
    @last_name = author[:last_name]
    @name = @first_name + " " + @last_name
  end

  def write(title, publication_date)
    book = Book.new({})
    book[:first_name] = @first_name
    book[:last_name] = @last_name
    book[:title] = title
    book[:publication_date] = publication_date
    book
  end
end
