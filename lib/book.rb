class Book
  def initialize(info)
    @info = info
  end

  def title
    @info[:title]
  end

  def author
    @info[:author_first_name].to_s + " " + @info[:author_last_name].to_s
  end

  def publication_year
    @info[:publication_date].split.last
  end
end
