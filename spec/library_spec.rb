require 'pry'
require './lib/library'

RSpec.describe Library do

  before(:each) do
    @dpl = Library.new("Denver Public Library")
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    @professor = @charlotte_bronte.write("The Professor", "1857")
    @villette = @charlotte_bronte.write("Villette", "1853")
    @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    @mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
  end

  describe '#initialize' do
    it 'has a name' do
      expect(@dpl.name).to eq("Denver Public Library")
    end

    it 'is initialized without any books' do
      expect(@dpl.books).to eq([])
    end

    it 'is initialized without any authors' do
      expect(@dpl.authors).to eq([])
    end
  end

  describe '#add_author' do
    it 'can add an author and their books' do
      @dpl.add_author(@charlotte_bronte)
      @dpl.add_author(@harper_lee)
      expect(@dpl.authors).to eq([@charlotte_bronte, @harper_lee])
      expect(@dpl.books).to eq([@jane_eyre, @professor, @villette, @mockingbird])
    end
  end

  describe '#publication_time_frame_for' do
    it 'can determine the earliest and latest publication years for a given author' do
      expect(@dpl.publication_time_frame_for(@charlotte_bronte)).to eq({:start => "1847", :end => "1857"})
      expect(@dpl.publication_time_frame_for(@harper_lee)).to eq({:start => "1960", :end => "1960"})
    end
  end

  describe '#checkout' do
    it 'can check out books' do
      @dpl.add_author(@charlotte_bronte)
      expect(@dpl.checkout(@jane_eyre)).to eq(true)
      expect(@dpl.checkout(@jane_eyre)).to eq(false)
    end
  end

  describe '#checked_out_books' do
    it 'is initialized without any books checked out' do
      expect(@dpl.checked_out_books).to eq([])
    end

    it 'adds a book to the collection when the book is checked out' do
      @dpl.add_author(@charlotte_bronte)
      @dpl.checkout(@jane_eyre)
      expect(@dpl.checked_out_books).to eq([@jane_eyre])
    end
  end

  describe '#return' do
    it 'can return books' do
      @dpl.add_author(@charlotte_bronte)
      @dpl.checkout(@jane_eyre)
      expect(@dpl.checked_out_books).to eq([@jane_eyre])
      @dpl.return(@jane_eyre)
      expect(@dpl.checked_out_books).to eq([])
    end
  end

  describe '#most_popular_book' do
    it 'can track the most popular book' do
      @dpl.add_author(@charlotte_bronte)
      @dpl.checkout(@jane_eyre)
      @dpl.checkout(@professor)
      @dpl.checkout(@villette)
      @dpl.return(@jane_eyre)
      @dpl.checkout(@jane_eyre)
      expect(@dpl.most_popular_book).to eq(@jane_eyre)
    end
  end
end
