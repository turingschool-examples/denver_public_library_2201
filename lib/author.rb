class Author

  attr_reader :author_info, :books

  def initialize(author_info)
    @author_info = author_info
    @books = []
  end

  def name
    @author_info[:first_name] + " " + @author_info[:last_name]
  end

  def write(author, publication_date)
  
  end
end
