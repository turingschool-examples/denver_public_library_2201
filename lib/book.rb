class Book
  attr_reader :title, :author, :publication_year

  def initialize(details)
    @title = details[:title]
    @author = details[:author_first_name] + " " + details[:author_last_name]
    @publication_year = (details[:publication_date]).chars.last(4).join
  end
end
