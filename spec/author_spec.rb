require './lib/book'
require './lib/author'
require 'pry'

RSpec.describe Author do

  it "exists" do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    expect(charlotte_bronte).to be_an_instance_of(Author)
  end

  it "has a full name" do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    expect(charlotte_bronte.name).to eq("Charlotte Bronte")
  end

  it "has no books by default" do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    expect(charlotte_bronte.books).to eq([])
  end

  it "writes a book" do
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    expect(jane_eyre).to be_an_instance_of(Book)
  end

  it "puts the book in the Book class" do
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    expect(jane_eyre.class).to eq(Book)
  end

  it "has a book title" do
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    expect(jane_eyre.title).to eq("Jane Eyre")
  end

  it "writes another book" do
    villette = charlotte_bronte.write("Villette", "1853")

    expect(villette).to be_an_instance_of(Book)
  end

  it "adds books to book array" do
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = charlotte_bronte.write("Villette", "1853")

    expect(charlotte_bronte.books).to eq([jane_eyre, villette])
  end
end
