require './lib/book'

class Author
  attr_reader :first_name, :last_name, :books
  def initialize(attributes)
    attributes.each do |k, v|
      self.instance_variable_set("@#{k}", v) unless v.nil?
    end
    @books = []
  end   

end
