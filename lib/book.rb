class Book
  attr_accessor :title, :author, :publication_date
  def initialize(book)
    @book = book
    @title = book[:title]
    @publication_date = book[:publication_date]
    @first_name = ""
    @last_name = ""
  end
  def publication_year
    @publication_date[-4..-1]
  end

  def name
    @first_name = @book[:author_first_name]
    @last_name = @book[:author_last_name]
  end

  def author
    name 
    @author = @first_name + " " + @last_name
  end
end
