class Book
  attr_reader :title

  def initialize(attributes)
    @author_first_name = attributes[:author_first_name]
    @author_last_name = attributes[:author_last_name]
    @title = attributes[:title]
    @publication_date = attributes[:publication_date]
  end

  def author
    "#{@author_first_name} #{@author_last_name}"
  end

  def publication_year
    @publication_date[-4..-1]
  end
end
