require 'pry'



class Book

  attr_reader :title, :author, :publication_date

  def initialize(hash)
    @title = hash[:title]
    @author = hash[:author_first_name] + " " + hash[:author_last_name]
    @publication_date = hash[:publication_date]
  end

  def publication_year
    if @publication_date.length == 4
      return @publication_date

    else
      c = @publication_date.length
      a = c - 4

      return @publication_date.slice(a .. c)
    end
  end

end
# binding.pry
