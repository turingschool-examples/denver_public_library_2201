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
    @books.concat(author.books)
  end 
  
  def publication_time_frame_for(author)
    publication_years_hash = {}
    all_pub_years = []
      author.books.each do |book|
        all_pub_years << book.publication_year
      end 
      # require "pry"; binding.pry
      all_pub_years.sort
        publication_years_hash[:start] = all_pub_years.sort[0]
        publication_years_hash[:end] = all_pub_years.sort[-1]
        # require "pry"; binding.pry
    return publication_years_hash
  end 
  
  def checkout(book_name)
    book_here = false
     @books.each do |book| 
       if book.title == book_name
         book_here = true
       end
     end
     require "pry"; binding.pry
   return book_here
  end



end
