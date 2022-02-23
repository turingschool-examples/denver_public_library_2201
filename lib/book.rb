class Book
  attr_reader :title
  def initialize(info_hash)
    @book_info = info_hash
    @title = info_hash[:title]
  end

  def publication_year
    @book_info[:publication_date].slice(-4..-1)
  end

  def author
    "#{@book_info[:author_first_name]} #{@book_info[:author_last_name]}"
  end
end
