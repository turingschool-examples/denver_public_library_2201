class Author
  attr_reader :first_name,
              :last_name

  def initialize(author_details)
    @first_name = author_details[:first_name]
    @last_name = author_details[:last_name]
  end
end
