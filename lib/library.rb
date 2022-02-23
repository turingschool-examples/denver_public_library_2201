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

  def add_author(author)
    @authors << author
    author.books.each do |book|
      @books << book
    end
  end

  def publication_time_frame_for(author)
    time_frame = {}
    book_dates = []

    author.books.each do |book|
      book_dates << book.publication_year.to_i
    end

    time_frame[:start] = book_dates.minmax.first.to_s
    time_frame[:end] = book_dates.minmax.last.to_s

    time_frame
  end
end
