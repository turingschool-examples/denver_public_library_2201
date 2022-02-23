class Author
  attr_reader :books

  def initialize(attributes)
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    @books = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def write(title, publication_date)
    book = Book.new({author_first_name: "#{@first_name}", author_last_name: "#{@last_name}", title: title, publication_date: publication_date})
    books << book
    return book
  end
end
