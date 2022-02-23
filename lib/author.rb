class Author
  attr_reader :first_name, :last_name, :books

  def initialize(attributes)
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    # @write = Book.new({author_first_name: ":first_name", author_last_name: ":last_name", title: "title", publication_date: "publication_date"})
    @books = []
  end

  def name
    "#{first_name} #{last_name}"
  end

  def write(title, publication_date)
    write = Book.new({author_first_name:, author_last_name:, title:, publication_date:})
    write[:author_first_name] = "first_name"
    write[:author_last_name] = "last_name"
    write[:title] = "title"
    write[:publication_date] = "publication_date"
  end

  def books
    @books << book
  end

end
