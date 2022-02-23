require 'pry'
require './lib/author'
require './lib/book'

RSpec.describe Author do

  before(:each) do
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  it 'exists' do
    expect(@charlotte_bronte).to be_an_instance_of(Author)
  end

  it 'has attributes' do
    expect(@charlotte_bronte.name).to eq("Charlotte Bronte")
    # expect(@charlotte_bronte.books).to eq([])
  end

  it 'adds a book to the authors bibliography' do
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = @charlotte_bronte.write("Villette", "1853")
    # binding.pry
    expect(@charlotte_bronte.books).to eq([jane_eyre, villette])
  end

end
