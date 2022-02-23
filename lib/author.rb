require './book'

class Author
  attr_reader :books

  def initialize(first_name: , last_name:)
    @first_name = first_name
    @last_name = last_name
    @books = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def write(name, publication_date)


end
