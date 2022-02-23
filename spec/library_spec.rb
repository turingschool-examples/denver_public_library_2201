require './lib/library'
require './lib/author'

RSpec.describe 'Library' do
  describe 'iteration 3' do
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857") 
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})    
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    
    it 'exists' do
      expect(dpl).to be_an_instance_of(Library)
    end

    it 'has readable attributes' do
      expect(dpl.name).to eq("Denver Public Library")
      expect(dpl.books).to eq([])
      expect(dpl.authors).to eq([])
    end

    it 'adds authors' do
      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)

      expect(dpl.authors).to eq([charlotte_bronte, harper_lee])
      expect(dpl.books).to eq([jane_eyre, professor, villette, mockingbird])
    end

    it 'finds publication range' do
      expect(dpl.publication_time_frame_for(charlotte_bronte)).to eq({:start => "1847", :end => "1857"})
      expect(dpl.publication_time_frame_for(harper_lee)).to eq({:start => "1960", :end => "1960"})
    end
  end

  describe 'iteration 4' do
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857") 
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})    
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    it 'checks out books in the library' do
      expect(dpl.checkout(jane_eyre)).to eq(false)

      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)

      expect(dpl.checkout(jane_eyre)).to eq(true)
      expect(dpl.checked_out_books).to eq([jane_eyre])
      expect(dpl.checkout(jane_eyre)).to eq(false)
      expect(dpl.checkout(villette)).to eq(true)
      expect(dpl.checked_out_books).to eq([jane_eyre, villette])
    end

    it 'returns books' do

      expect(dpl.checkout(mockingbird)).to eq(true)
      expect(dpl.checked_out_books).to eq([jane_eyre, villette, mockingbird])
      expect(dpl.return(mockingbird)).to eq(true)
      expect(dpl.checked_out_books).to eq([jane_eyre, villette])
    end

    it 'finds the most popular book' do
      dpl.checkout(mockingbird)
      dpl.return(mockingbird)
      dpl.checkout(mockingbird)
      dpl.return(mockingbird)

      expect(dpl.most_popular_book).to eq(mockingbird)
    end
  end
end