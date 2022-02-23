require './lib/book'
require './lib/author'
require 'pry'

class Library
  attr_reader :name, :books, :authors, :checked_out_books

  def initialize(name, books = [], authors = [], checked_out_books = [])
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

  def checkout(book)
    if !@books.include?(book)
      false
    end
  end
  
end
