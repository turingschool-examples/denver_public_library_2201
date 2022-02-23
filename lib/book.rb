class Book
  attr_reader :title, :author, :publication_year
  def initialize(book)
    @title = book[:title]
    @author = book[:author_first_name] + " " + book[:author_last_name]
    @publication_year = book[:publication_date][-4..-1]
  end

end
