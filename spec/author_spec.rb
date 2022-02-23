require 'pry'
require './lib/author'

RSpec.describe Author do

  before(:each) do
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  describe '#initialize' do
    it 'has a name' do
      expect(@charlotte_bronte.name).to eq("Charlotte Bronte")
    end

    it 'is initialized without any books' do
      expect(@charlotte_bronte.books).to eq([])
    end
  end

  describe '#write' do
    it 'can write books' do
      jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      villette = @charlotte_bronte.write("Villette", "1853")
      expect(@charlotte_bronte.books).to eq([jane_eyre, villette])
      expect(jane_eyre).to be_a(Book)
      expect(villette).to be_a(Book)
      expect(jane_eyre.title).to eq("Jane Eyre")
      expect(villette.author).to eq("Charlotte Bronte")
    end
  end
end
