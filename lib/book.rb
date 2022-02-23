class Book
  attr_reader :title
  
  def initialize(info)
    @first_name = info[:author_first_name]
    @last_name = info[:author_last_name]
    @title = info[:title]
    @publication_date = info[:publication_date]
  end

  def author
  return "#{@first_name} #{@last_name}"  
  end
  
  def publication_year
    pub_year =  @publication_date[-4..-1]
    return pub_year
    
  end
end
