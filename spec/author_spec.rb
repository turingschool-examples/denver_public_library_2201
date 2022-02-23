require './lib/book'
require './lib/author'

RSpec.describe Author do
  let(:charlotte_bronte) {
    Author.new({ first_name: "Charlotte", last_name: "Bronte" })
  }
  let(:book) {
    Book.new({ author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird",
               publication_date: "July 11, 1960" })
  }
  let(:jane_eyre){Book.new("Jane Eyre", "October 16, 1847")}
  let(:villette){Book.new("Villette", "1853")}
  it 'exists' do
    expect(charlotte_bronte).to be_a(Author)
  end

  it "can return the author name" do
    expect(charlotte_bronte.name).to eq("Charlotte Bronte")
  end

  it 'can have a books array' do
    expect(charlotte_bronte.books).to eq([])
  end

  it 'can write a book to add to books array' do

    charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    charlotte_bronte.write("Villette", "1853")
    expect(charlotte_bronte.books).to eq([jane_eyre, villette])
  end
end
