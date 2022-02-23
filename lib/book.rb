class Book
  attr_accessor :book, :title, :author, :publication_date
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
    if @first_name != ""
      @author = @first_name + " " + @last_name
    end
  end
end
