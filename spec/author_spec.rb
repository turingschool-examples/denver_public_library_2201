require_relative '../lib/book.rb'
require_relative '../lib/author.rb'

RSpec.describe Book do
  charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  
  before(:each) do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  it "initializes with a single hash argument" do
    expect(charlotte_bronte).to be_an_instance_of(Author)
  end

  it "returns a full name with the #name method" do
    expect(charlotte_bronte.name).to eq("Charlotte Bronte")
  end

  it "returns an empty array of books after initialization with the #books method" do
    expect(charlotte_bronte.books).to eq([])
  end

  it "can publish a new book object with the #write method" do
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    expect(jane_eyre.class).to eq(Book)
    expect(jane_eyre.title).to eq("Jane Eyre")
  end



  it "adds written books to the @books attribute" do
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = charlotte_bronte.write("Villette", "1853")

    expect(charlotte_bronte.books).to eq([jane_eyre, villette])
  end

end
