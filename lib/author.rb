class Author

attr_reader :name
  def initialize(author)
    @name = author[:first_name] + " " + author[:last_name]
  end
  
end
