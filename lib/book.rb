

class Book
  attr_reader :title, :author_first_name, :author_last_name, :publication_date
  def initialize(attributes)
    attributes.each do |k, v|
      self.instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  def author
     @author = #@author_first_name.concat(@author_last_name)
     # [author_first_name, author_last_name].reject{|s| s.empty?}.join("")
     [author_first_name, author_last_name].inject("") {|k,v| v.empty? ? k : k << " " << v }.strip
  end

  def publication_year
    @publication_year = @publication_date[-4..-1]
    return @publication_year
  end

  

end
