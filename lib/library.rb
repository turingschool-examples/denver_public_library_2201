class Library
  attr_reader :name, :books, :authors
  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    authors << author
    @books << author.books.sort_by { |book| book.publication_year.to_i }
    @books.flatten!
  end

  def publication_time_frame_for(author)
    timeframe = {}
    timeframe[:start] = (books.find { |book|
      book.author == author.name
    }).publication_year

    timeframe[:end] = (books.find_all { |book|
      book.author == author.name
    }[-1]).publication_year

    timeframe
  end
end
