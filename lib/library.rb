require './author'

class Library
  attr_reader :name, :books, :authors, :checked_out_books, :check_out_count

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
    @check_out_count = {}
  end

  def add_author(author)
    authors << author
    author.books.each do |book|
      books << book
      check_out_count[book.title] = 0
    end
  end
  
  def publication_time_frame_for(author)
    pub_years = []
    author.books.each do |book|
      pub_years << book.publication_year.to_i
    end
    return {:start => pub_years.min.to_s, :end => pub_years.max.to_s}
  end

  def checkout(book)
    if books.include?(book) && checked_out_books.include?(book) == false
      check_out_count[book.title] += 1
      checked_out_books << book
      return true
    else
      return false
    end
  end

  def return(book)
    if books.include?(book) && checked_out_books.include?(book)
      checked_out_books.delete(book)
      return true 
    else
      return false
    end
  end

  def most_popular_book
    most_checked_out = check_out_count.max_by{|k,v| v}
    return books.find{|book| book.title == most_checked_out[0]}
  end
end