class Library
attr_reader :name, :books, :authors
    def initialize(name)
      @name = name
      @books = []
      @authors = []
    end

    def add_author(author)
      @authors << author
      # require "pry"; binding.pry
      add_books
    end

    def add_books
    @authors.each {|author| author.books.each {|book| @books << book if !@books.include?(book)}}
    end

    def publication_time_frame_for(author)

      years_of_pub = author.books.map {|book| book.publication_year}
      publication_time_frame = {start: years_of_pub.min, end: years_of_pub.max}
    end
end
