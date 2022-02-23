class Library
attr_reader :name, :books, :authors, :checked_out_books, :books_lent_counter
    def initialize(name)
      @name = name
      @books = []
      @authors = []
      @checked_out_books = []
      @books_lent_counter = Hash.new(0)
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

    def checkout(book)
      @books_lent_counter[book.title] += 1
      if @books.include?(book)
        @checked_out_books << @books.delete(book)
        true
      else
        false
      end
    end

    def return(book)
      @books << book
      @checked_out_books.delete(book)
    end

    def most_popular_book
      book = @books_lent_counter.max_by {|title, num| num}
      title = book[0]
      book_checked = @checked_out_books.find {|book| book.title == title}
      book_returned = @books.find{|book| book.title == title}
      if book_checked == nil
        book_returned
      else
        book_checked
      end
    end
end
