require 'rspec'
require './lib/library'

describe Library do
  before (:each) do
    @dpl = Library.new("Denver Public Library")
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    @professor = @charlotte_bronte.write("The Professor", "1857")
    @villette = @charlotte_bronte.write("Villette", "1853")
    @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    @mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
  end

  describe '#initialize' do
    it 'exists' do
      expect(@dpl).to be_an_instance_of(Library)
    end

    it 'has a name' do
      expect(@dpl.name).to eq("Denver Public Library")
    end

    it 'has lists of books and authors' do
      expect(@dpl.books).to eq([])
      expect(@dpl.authors).to eq([])
    end
  end

  describe '#add_author' do
    it 'can add authors' do
      @dpl.add_author(@charlotte_bronte)
      @dpl.add_author(@harper_lee)
      expect(@dpl.authors).to eq([@charlotte_bronte, @harper_lee])
    end

    it 'adds books when it adds authors' do
      @dpl.add_author(@charlotte_bronte)
      @dpl.add_author(@harper_lee)
      expect(@dpl.books).to eq([@jane_eyre, @professor, @villette, @mockingbird])
    end
  end

  describe '#publication_time_frame' do
    it 'gives a range of publication dates of an author' do
      @dpl.add_author(@charlotte_bronte)
      @dpl.add_author(@harper_lee)

      expect(@dpl.publication_time_frame(@charlotte_bronte)).to eq({:start => "1847", :end => "1857"})

      expect(@dpl.publication_time_frame(@harper_lee)).to eq({:start => "1960", :end => "1960"})
    end
  end

    describe '#checkout' do
      it 'cannot check out books that are  not in library' do
        expect(@dpl.checkout(@jane_eyre)).to be false
        expect(@dpl.checkout(@mockingbird)).to be false
      end

      it 'can check books out' do
        @dpl.add_author(@charlotte_bronte)
        @dpl.add_author(@harper_lee)

        expect(@dpl.checkout(@jane_eyre)).to be true
        expect(@dpl.checked_out_books).to eq([@jane_eyre])
        @dpl.checkout(@villette)
        expect(@dpl.checked_out_books).to eq([@jane_eyre, @villette])
      end

      it 'cannot check out a book that is already checked out' do
        @dpl.add_author(@charlotte_bronte)
        @dpl.add_author(@harper_lee)
        @dpl.checkout(@jane_eyre)
        expect(@dpl.checkout(@jane_eyre)).to be false
      end
    end

    describe '#return' do
      it 'can be returned' do
        @dpl.add_author(@charlotte_bronte)
        @dpl.add_author(@harper_lee)
        @dpl.checkout(@jane_eyre)

        @dpl.return(@jane_eyre)
        expect(@dpl.checked_out_books).to eq([])
      end

      it 'can be checked out again after it is returned' do
        @dpl.add_author(@charlotte_bronte)
        @dpl.add_author(@harper_lee)
        expect(@dpl.checkout(@mockingbird)).to be true
        expect(@dpl.checkout(@mockingbird)).to be false
        @dpl.return(@mockingbird)
        expect(@dpl.checkout(@mockingbird)).to be true
      end
    end

    describe '#most_popular_book' do
      it 'can tell you the book that has been checked out the most' do
        @dpl.add_author(@charlotte_bronte)
        @dpl.add_author(@harper_lee)
        4.times do
          @dpl.checkout(@professor)
          @dpl.return(@professor)
        end
        @dpl.checkout(@jane_eyre)
        @dpl.checkout(@villette)
        @dpl.return(@jane_eyre)
        @dpl.return(@villette)
        @dpl.checkout(@jane_eyre)
        @dpl.return(@jane_eyre)

        expect(@dpl.most_popular_book).to eq(@professor)
      end
    end
end
