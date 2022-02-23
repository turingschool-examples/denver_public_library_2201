class Author
  attr_reader :first_name,
              :last_name,
              :books,
              :book

  def initialize(author_details)
    @first_name = author_details[:first_name]
    @last_name = author_details[:last_name]
    @books = []
  end

  def name
    "#{first_name} #{last_name}"
  end

  def write(title, publication_date)
    @books << Book.new({
                         author_first_name: @first_name,
                         author_last_name: @last_name,
                         title: title,
                         publication_date: publication_date
                       })
  end
end
