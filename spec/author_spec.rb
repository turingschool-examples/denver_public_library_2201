require "./lib/book"
require "./lib/author"

RSpec.describe Author do
      before=(:each) do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    it "exists and is an instance of class Author" do
      expect(charlotte_bronte).to be_a(Author)
    end

    it 'can return attributes of the authror' do
      expect(charlotte_bronte.name).to eq("Charlotte Bronte")
    end

    it 'can return the empty array for #books the author has written' do
      expect(charlotte_bronte.books).to eq([])
    end

    it 'can create instances of the Book class' do
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      villette = charlotte_bronte.write("Villette", "1853")
      expect(jane_eyre).to be_a(Book)
    end

    it "can return attributes of the Book class instances" do
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      villette = charlotte_bronte.write("Villette", "1853")
      expect(jane_eyre.class).to eq(Book)
      expect(jane_eyre.title).to eq("Jane Eyre")
    end

    it 'can return an array containing Books an author has written' do
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      villette = charlotte_bronte.write("Villette", "1853")
      expect(charlotte_bronte.books).to eq([jane_eyre, villette])
    end

    it 'can add books to the book array using the #write method' do
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      villette = charlotte_bronte.write("Villette", "1853")
    end
end
