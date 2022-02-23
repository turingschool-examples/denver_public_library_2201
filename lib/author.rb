require './lib/book'

class Author
  attr_reader :name, :books
  def initialize(name)
    @name = "#{name[:first_name]} #{name[:last_name]}"
    @books = []
  end
end
