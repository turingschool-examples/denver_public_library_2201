class Book
  attr_reader :author_first_name, :author_last_name, :title 

  def initialize(bookmetadata)
    @author_first_name = bookmetadata.fetch(:authFN)
    @author_last_name = bookmetadata.fetch(:authLN)
    @title = bookmetadata.fetch(:ttl)
    @publication_date = boommetadata.fetch(:pub_date)
  end

  def publication_year
    puts bookmetadata[:pub_date][-4..-1]
  end

end
