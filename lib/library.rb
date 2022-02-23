require_relative 'author'

class Library
  attr_reader :name, :books, :authors, :checked_out_books
  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
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

  def checkout(book)
    is_checked_out = false
    if @checked_out_books.none?(book)
      if @books.include?(book) && is_checked_out == false
        @checked_out_books << book
        is_checked_out = true
      end
    end
    is_checked_out
  end

end
