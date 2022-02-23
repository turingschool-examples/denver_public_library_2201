require './author'

class Library
  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    authors << author
    author.books.each do |book|
      books << book
    end
  end
  
  def publication_time_frame_for(author)
    pub_years = []
    author.books.each do |book|
      pub_years << book.publication_year.to_i
    end
    return {:start => pub_years.min.to_s, :end => pub_years.max.to_s}
  end
end