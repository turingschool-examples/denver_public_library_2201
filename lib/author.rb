require 'pry'
class Author

attr_accessor :first_name, :last_name, :books

  def initialize(info)
    @first_name = info[:first_name]
    @last_name = info[:last_name]
    @books = []
  end


  def name
    return "#{first_name} #{last_name}"
  end

  def write(title, date)
    books.push(Book.new ({title: title, publication_date: date}))
    return Book.new ({title: title, publication_date: date})
  end

end
