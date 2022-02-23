require './lib/author'
require './lib/book'

RSpec.describe Author do

  context 'Iteration 2' do
    charlotte_bronte = Author.new({
      first_name: "Charlotte",
      last_name: "Bronte"
      })

    it 'exist and has attributes' do
      expect(charlotte_bronte).to be_an_instance_of(Author)
      expect(charlotte_bronte.name).to eq("Charlotte Bronte")
      expect(charlotte_bronte.books).to eq([])
    end

    it 'can write a book' do
      expect(charlotte_bronte.write("Jane Eyre", "October 16, 1847")).to be_an_instance_of(Book)
    end

  end
end
