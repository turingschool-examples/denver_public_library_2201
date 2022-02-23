class Book
  attr_reader :title
  def initialize(book)
    @title = book[:title]
  end

end
