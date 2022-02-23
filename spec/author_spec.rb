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
end
