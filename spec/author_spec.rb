require 'rspec'
require './lib/author'

describe Author do
  charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

  describe 'initialization' do
    it 'has a name' do
      expect(charlotte_bronte.name).to eq("Charlotte Bronte")
    end

    it 'starts with no books' do
      expect(charlotte_bronte.books).to eq([])
    end
  end

  describe "write" do
    it 'creates a book instance and adds it to @books' do
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      expect(jane_eyre.class).to eq(Book)
      expect(jane_eyre.title).to eq("Jane Eyre")
      villette = charlotte_bronte.write("Villette", "1853")
      expect(charlotte_bronte.books).to eq([jane_eyre, villette])
    end

  end
end
