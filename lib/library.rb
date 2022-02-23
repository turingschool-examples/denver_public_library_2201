require 'pry'
require './lib/book'
require './lib/author'

class Library

  attr_reader :name,
              :books,
              :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    author.books.each do |book|
      @books << book
    end.flatten
  end

  def publication_time_frame_for(author)
    publication_years = author.books.map {|book| book.publication_year.to_i}
    publication_years = publication_years.sort {|a, b| a <=> b}
    publication_years = publication_years.map {|year| year.to_s}
    time_frame = {
      start: publication_years[0],
      end: publication_years[-1]
      }
  end

end
