require './lib/author'

class Library
  attr_reader :name
  def initialize(name)
    @name = name
  end
end 
