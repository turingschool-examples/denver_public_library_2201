class Book

  attr_accessor :title,
                :author,
                :publication_year,
                :times_checked_out

  def initialize(attributes)
    @title = attributes[:title]
    @author = "#{attributes[:author_first_name]} #{attributes[:author_last_name]}"
    @publication_year = attributes[:publication_date][-4..-1]
    @times_checked_out = 0
  end

end
