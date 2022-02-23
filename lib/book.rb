class Book
  attr_reader :author, :title, :publication_year
  def initialize(reference_info = Hash.new)
    @reference_info = reference_info
    @author = "#{reference_info[:author_first_name]} #{reference_info[:author_last_name]}"
    @title = reference_info[:title]
    @publication_year = reference_info[:publication_date][-4..-1]
  end
end
