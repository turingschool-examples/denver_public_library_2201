require_relative 'author'
require_relative 'book'

class Library

  attr_reader :name, :books, :authors
  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end


end
