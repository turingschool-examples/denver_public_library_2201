class Author

attr_reader :name, :books
  def initialize(author)
    @name = author[:first_name] + " " + author[:last_name]
    @books = []
  end

end
