class Book
  attr_reader :title, :author
  def initialize(book)
    @title = book[:title]
    @author = book[:author_first_name] + " " + book[:author_last_name]
  end

end
