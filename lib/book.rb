class Book
attr_reader :title, :author, :publication_year
  def initialize(attributes)
    @title = attributes[:title]
    @author = attributes[:author_first_name] + " " + attributes[:author_last_name]
    @publication_year = attributes[:publication_date][9..-1]
  end

end
