class Author
  attr_reader :author_info
  
  def initialize(author_info = {})
    @author_info = author_info
  end
end
