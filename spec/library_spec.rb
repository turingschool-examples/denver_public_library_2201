require 'rspec'
require './lib/library'

describe Library do
  dpl = Library.new("Denver Public Library")
  charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})

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

  describe 'add_author' do
    it 'adds the given Author to @authors' do
      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)
      expect(dpl.authors).to eq([charlotte_bronte, harper_lee])
    end

    it "adds all of the author's @books to the library's @books" do
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      villette = charlotte_bronte.write("Villette", "1853")
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)
      expect(dpl.books).to eq([jane_eyre, professor, villette, mockingbird])
    end
  end

  describe 'publication_time_frame_for' do
    it 'returns the oldest publication_year and the newest publication_year' do
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      villette = charlotte_bronte.write("Villette", "1853")
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)

      expect(dpl.publication_time_frame_for(charlotte_bronte)).to eq({:start=>"1847", :end=>"1857"})
      expect(dpl.publication_time_frame_for(harper_lee)).to eq({:start=>"1960", :end=>"1960"})
    end
  end

  describe "checkout" do
    it 'returns true if the book is in the library' do
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      villette = charlotte_bronte.write("Villette", "1853")
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

      expect(dpl.checkout(mockingbird)).to eq(false)
      expect(dpl.checkout(jane_eyre)).to eq(false)

      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)
      expect(dpl.checkout(jane_eyre)).to eq(true)
    end

    it 'adds the book to checked_out_books' do
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      villette = charlotte_bronte.write("Villette", "1853")
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)
      dpl.checkout(jane_eyre)


      expect(dpl.checked_out_books).to eq([jane_eyre])
    end

    it 'can not checkout a book if it is already checked out' do
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      villette = charlotte_bronte.write("Villette", "1853")
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)
      dpl.checkout(jane_eyre)

      expect(dpl.checkout(jane_eyre)).to eq(false)
    end
  end
end
