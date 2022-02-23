require './lib/book'
require './lib/author'
require 'pry'
require 'rspec'

RSpec.describe Author do
  let(:charlotte_bronte) {Author.new({first_name: "Charlotte", last_name: "Bronte"}) }
  describe 'iteration 2' do
    it 'exists' do

      expect(charlotte_bronte).to be_a(Author)
    end

    it 'can read the full name' do

      expect(charlotte_bronte.name).to eq("Charlotte Bronte")
    end

    it 'can list the authors book array' do

      expect(charlotte_bronte.books).to eq([])
    end

    it 'can add books to the list' do
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

      expect(jane_eyre.class).to eq(Book) # is this a joke??
      expect(jane_eyre.title).to eq("Jane Eyre")
      villette = charlotte_bronte.write("Villette", "1853")
      # charlotte_bronte.add_book(jane_eyre)
      # charlotte_bronte.add_book(villette)
      expect(charlotte_bronte.books).to eq([jane_eyre, villette])
    end
  end
end
