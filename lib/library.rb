require_relative 'author'

class Library
  attr_reader :name, :books, :authors
  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    author.books.each do |book|
      @books << book
    end
  end

  def publication_time_frame_for(desired_author)
    years = []
    time_frame = {:start => nil, :end => nil}
    @authors.each do |author|
      if author.name == desired_author.name
        author.books.each do |book|
          years << book.publication_year.to_i
        end
      end
    end
    time_frame[:start] = years.min.to_s
    time_frame[:end] = years.max.to_s
    return time_frame
  end

end
