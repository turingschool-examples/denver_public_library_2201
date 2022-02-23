require 'rspec'
require './lib/library'

describe Library do
  dpl = Library.new("Denver Public Library")
  charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
  jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
  professor = charlotte_bronte.write("The Professor", "1857")
  villette = charlotte_bronte.write("Villette", "1853")
  mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

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
