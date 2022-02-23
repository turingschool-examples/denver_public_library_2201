require 'pry'



class Author


  attr_reader :first_name, :last_name, :books

  def initialize(attributes)
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    @books = []
  end

  def name
    @first_name + ' ' + @last_name
  end

  def write(title, publication_date)
    #Book.new
  end

end
