require 'pry'
require './lib/author'
require './lib/book'

RSpec.describe Author do
  it 'exists' do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    expect(charlotte_bronte).to be_an_instance_of(Author)
  end

  it 'can list authors full name' do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    expect(charlotte_bronte.name).to eq("Charlotte Bronte")
  end

  it 'has an empty array of books by default' do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    expect(charlotte_bronte.books).to eq([])
  end

  it 'can create an instance of a book' do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    expect(jane_eyre.class).to eq(Book)
  end

  it 'can list the new books title' do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    expect(jane_eyre.title).to eq("Jane Eyre")
  end

  it 'adds new book to list of books' do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = charlotte_bronte.write("Villette", "1853")
    expect(charlotte_bronte.books).to eq([jane_eyre, villette])
  end



end
