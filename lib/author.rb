class Author
  attr_reader :books
  
  def initialize(attributes)
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    @books = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end
end
