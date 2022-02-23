class Author
attr_reader :books

  def initialize(info)
    @first_name = info[:first_name]
    @last_name = info[:last_name]
    @books = []
  end
  def name
    return "#{@first_name} #{@last_name}"
    
  end
  def write(title, publication_date)
    new_book = Book.new({author_first_name: "#{@first_name}", author_last_name: "#{@last_name}",
       title: title, publication_date: publication_date})
       @books << new_book
    return new_book 
  end



end
