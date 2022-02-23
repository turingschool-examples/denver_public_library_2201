class Author
  attr_reader :books
  def initialize(name_hash)
    @name_hash = name_hash
    @books = []
  end

  def name
    "#{@name_hash[:first_name]} #{@name_hash[:last_name]}"
  end

  #shovels new_book to @books for later lookup, then calls new_book to ensure return is a Book object
  def write (title, date)
    new_book = Book.new({
      author_first_name: @name_hash[:first_name],
      author_last_name: @name_hash[:last_name],
      title: title,
      publication_date: date
    })
    @books << new_book
    new_book
  end
end
