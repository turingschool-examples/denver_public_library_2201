require './lib/book'
require './lib/author'

RSpec.describe Author do
  before(:each) do
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  it "exists" do
    expect(@charlotte_bronte).to be_an_instance_of(Author)
  end

  it "has a name" do
    expect(@charlotte_bronte.name).to eq("Charlotte Bronte")
  end

  it "has no books after initialized" do
    expect(@charlotte_bronte.books).to eq([])
  end

  it "can write a book" do
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    expect(jane_eyre).to be_an_instance_of(Book)
    expect(jane_eyre.title).to eq("Jane Eyre")
  end


end
