require './lib/book'
require './lib/author'

class Library
  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @author = author

    @authors << @author
    @authors.map do |author|
      @books << @author.books.flatten
    end
    @books.flatten!.uniq!
  end

  def publication_time_frame_for(author)
    hash = {}
    n =[]
    @authors.each do |writer|
      if writer.name == author.name
        writer.books.each do |book|
          n << book.publication_year
      end
    end
    end
    hash[:start] = n.sort[0]
    hash[:end] = n.sort[-1]
    hash

  end



end
