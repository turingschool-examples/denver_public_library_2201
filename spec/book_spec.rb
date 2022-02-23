require './lib/book'

RSpec.descibe Book do
  let(:book) {
    Book.new({ author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird",
               publication_date: "July 11, 1960" })
  }
  it 'exists' do
    expect(book).to be_a(Book)
  end

  it 'has attributes' do
    expect(book.author_first_name).to eq("Harper")
    expect(book.author_last_name).to eq("Lee")
    expect(book.title).to eq("To Kill a Mockingbird")
    expect(book.publication_year).to eq("1960")
  end
end
