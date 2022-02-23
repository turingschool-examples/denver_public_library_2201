require_relative 'book'

class Author

  attr_reader :name, :books
  def initialize(details)
    @name = details[:first_name] + " " + details [:last_name]
    @books = []
  end
  
end
