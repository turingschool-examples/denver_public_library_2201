require 'rspec'
require './lib/book.rb'
require './lib/author.rb'
require 'pry'

RSpec.describe Book do
  it "exists" do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    expect(charlotte_bronte.name).to eq("Charlotte Bronte")
    expect(charlotte_bronte.books).to eq([])
  end

  it "exists" do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    expect(jane_eyre.class).to eq(Book)
    expect(jane_eyre.title).to eq("Jane Eyre")
  end

  it "exists" do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = charlotte_bronte.write("Villette", "1853")
    expect(charlotte_bronte.books.length).to eq(2)
  end

end
