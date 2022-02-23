class Author
  attr_reader :books

  def initialize(info)
    @first_name = info[:first_name]
    @last_name = info[:last_name]
    @books = []
  end

  def name
    @first_name + ' ' + @last_name
  end



  def write(book)
    @books << book
  end
end
