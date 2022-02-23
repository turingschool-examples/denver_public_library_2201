
class Book
  attr_reader :title, :publication_year
  attr_accessor :times_checked_out

  def initialize(info)
    @info = info
    @title = "#{info[:title]}"
    @publication_year = info[:publication_date].split.last
    @times_checked_out = 0
  end

  def author
    "#{@info[:author_first_name]} #{@info[:author_last_name]}"
  end
end
