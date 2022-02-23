class Author
  attr_reader :name, :books
  def initialize(first_and_last_name = Hash.new)
    @first_and_last_name = first_and_last_name
    @name = "#{first_and_last_name[:first_name]} #{first_and_last_name[:last_name]}"
    @books = []
  end

  def write(title, date)
    new_book = Book.new({title: title, publication_date: date})
    @books << new_book
    return new_book
  end
end
