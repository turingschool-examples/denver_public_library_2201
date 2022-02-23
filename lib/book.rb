class Book
  def initialize(info)
    @info = info
  end

  def title
    @info[:title]
  end

  def author
    @info[:author_first_name] + " " + @info[:author_last_name]
  end

  def publication_year
    @info[:publication_date][-4..-1]
  end
end
