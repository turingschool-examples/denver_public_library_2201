class Library
  attr_reader :name, :books, :authors, :checked_out_books
  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
  end

  def add_author(author)
    authors << author
    @books << author.books.sort_by { |book| book.publication_year.to_i }
    @books.flatten!
  end

  def publication_time_frame_for(author)
    timeframe = {}

    timeframe[:start] = (books.find { |book|
      book.author == author.name }).publication_year

    timeframe[:end] = (books.find_all { |book|
      book.author == author.name }[-1]).publication_year

    timeframe
  end

  def checkout(book)
    if @checked_out_books.include?(book)
      return false
    elsif @books.include?(book)
      @checked_out_books << book
      book.checkout_count += 1
      return true
    else
      return false
    end
  end

  def return(book)
    if @checked_out_books.include?(book)
      @checked_out_books.delete(book)
    end
  end

  def most_popular_book
    @books.sort_by{ |book| book.checkout_count }[-1]
  end
end
