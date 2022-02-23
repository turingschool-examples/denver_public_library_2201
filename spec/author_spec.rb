require 'rspec'
require 'pry'
require './lib/author'
require './lib/book'

describe Author do
  it "exists" do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    expect(charlotte_bronte.name).to eq("Charlotte Bronte")
    expect(charlotte_bronte.books).to eq([])
  end

  it "can write" do
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    expect(jane_eyre.class).to be_an_instance_of(Book)
    expect(jane_eyre.title).to eq("Jane Eyre")
  end
end
