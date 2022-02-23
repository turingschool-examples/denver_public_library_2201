class Library
  attr_reader :name

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author
    @author << author
  end

  def books
    @books << book
  end

  def publication_time_frame_for(author)
    publication_time_frame_for_hash = Hash.new()
    if publication_time_frame_for_hash[book.publication_year]
      publication_time_frame_for_hash[book.publication_year] << publication_year
    else
      publication_time_frame_for_hash[book.publication_year] = [publication_year]
    end
    publication_time_frame_for_hash.sort
  end
end
