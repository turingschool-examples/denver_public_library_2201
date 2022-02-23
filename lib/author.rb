require './lib/book'

class Author
  attr_reader :first_name, :last_name, :books, :book
  def initialize(attributes)
    attributes.each do |k, v|
      self.instance_variable_set("@#{k}", v) unless v.nil?
    end
    @books = []
  end

  def name
    [first_name, last_name].inject("") {|k,v| v.empty? ? k : k << " " << v }.strip
  end

  def write(title, publication_date)
    @book = Book.new({})
  end

  def add_book(book)
    @books << book
  end 




end
