require './lib/book'

class Author
  attr_reader :first_name, :last_name

  def initialize(authmetadata)
    @first_name = authmetadata.fetch(:FName)
    @last_name = authmetadata.fetch(:LName)
    @books = []
  end

  def mkname
    puts "#{@first_name + @last_name}"
  end

end
