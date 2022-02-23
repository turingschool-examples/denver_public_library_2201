require './lib/book'
require './lib/author'
require 'pry'

class Library
  attr_reader :name, :books, :authors, :checked_out_books, :book_popularity

  def initialize(name, books = [], authors = [], checked_out_books = [], book_popularity = Hash.new(0))
    @name = name
    @books = books
    @authors = authors
    @checked_out_books = checked_out_books
    @book_popularity = book_popularity
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
    if !@books.include?(book) || @checked_out_books.include?(book)
      false
    else
      @checked_out_books << book
      @book_popularity[book] += 1
      true
    end
  end

  def return(book)
    @checked_out_books.delete(book)
  end

  def most_popular_book
    most_popular_book = nil

    checked_out_amounts_array = @book_popularity.map { |book, num_checked_out| num_checked_out }
    
    @book_popularity.each do |book, num_checked_out|
      most_popular_book = book if num_checked_out == checked_out_amounts_array.max
    end

    most_popular_book
  end

end
