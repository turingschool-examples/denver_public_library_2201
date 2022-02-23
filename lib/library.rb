class Library
  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author (author_object)
    @authors << author_object
    author_object.books.each {|book| @books << book}
  end

  def publication_time_frame_for author_object
    # output = {start: -Float::INFINITY, end: Float::INFINITY}
    output = {}
    output[:start] = author_object.books.min{|a, b| a.publication_year <=> b.publication_year}.publication_year
    output[:end] = author_object.books.max{|a, b| a.publication_year <=> b.publication_year}.publication_year
     output
  end

end
