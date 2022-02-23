require 'rspec'
require './lib/book'
require './lib/author'

RSpec.describe Author do
  it "exists" do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    expect(charlotte_bronte).to be_an_instance_of(Author)
  end

  it "can return author name and books written as an empty array" do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    expect(charlotte_bronte.name).to eq("Charlotte Bronte")
    expect(charlotte_bronte.books).to eq([])
  end

  it "has class method 'write' which creates instance of Book and adds it to books array" do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = charlotte_bronte.write("Villette", "1853")

    expect(jane_eyre.class).to eq(Book)
    expect(jane_eyre.title).to eq("Jane Eyre")
    expect(charlotte_bronte.books).to eq([jane_eyre, villette])

  end
end
