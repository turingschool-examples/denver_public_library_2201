require './lib/book'
require './lib/author'
require 'pry'

class Library
  attr_reader :name, :books, :authors
  
  def initialize(name, books = [], authors = [])
    @name = name
    @books = books
    @authors = authors
  end
end
