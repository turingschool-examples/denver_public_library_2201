class Author
attr_reader :name, :books

  def initialize(attributes)
    @name = attributes[:first_name] + " " + attributes[:last_name]
    @books = []
  end

end
