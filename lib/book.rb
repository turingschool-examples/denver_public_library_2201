
class Book

  attr_accessor :author_first_name, :author_last_name, :title, :publication_date

  def initialize(info)
    @author_first_name = info[:author_first_name]
    @author_last_name = info[:author_last_name]
    @title = info[:title]
    @publication_date = info[:publication_date]
  end

end
