require 'rspec'
require './lib/library'

describe Library do
  dpl = Library.new("Denver Public Library")

  describe 'initialization' do
    it 'has a name' do
      expect(dpl.name).to eq("Denver Public Library")
    end

    it 'starts with no books' do
      expect(dpl.books).to eq([])
    end

    it 'starts with no authors' do
      expect(dpl.authors).to eq([])
    end
  end
end
