class Library
  attr_reader :name, :books, :authors, :add_author, :add_book
  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
  end

  def add_book(book)
    @books << book
  end

  def publication_time_frame_for(author)
    time_frame = {}
    author.each do |books|
      time_frame[:start] = books.publication_date.first
      time_frame[:end] = books.publication_date.last
    end
    time_frame
  end
end
