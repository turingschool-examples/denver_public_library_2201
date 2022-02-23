class Library
attr_reader :name, :books, :authors
    def initialize(name)
      @name = name
      @books = []
      @authors = []
    end

    def add_author(author)
      @authors << author
      @authors.each {|author| author.books.each {|book| @books << book if !@books.include?(book)}}
      # require "pry"; binding.pry
    end

end
