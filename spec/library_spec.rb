require "./lib/book"
require "./lib/author"
require "./lib/library"

RSpec.describe Library do
    before(:each) do
      @dpl = Library.new("Denver Public Library")
      @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
      @villette = charlotte_bronte.write("Villette", "1853")
      @professor = charlotte_bronte.write("The Professor", "1857")
      @jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      @mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    end

    it "exists and is an instance of class Author" do
      expect(@dpl).to be_a(Library)
    end

    it 'can return attributes of the authror' do
      expect(@dpl.name).to eq("Denver Public Library")
    end

    it 'can return an emoty array for #books and #authors methods' do
      expect(@dpl.books).to eq([])
      expect(@dpl.authors).to eq([])
    end

    it 'can #add_author to the #authors array' do
      @dpl.add_author(charlotte_bronte)
      @dpl.add_author(harper_lee)
      expect(@dpl.authors).to eq([charlotte_bronte, harper_lee])
    end

    it 'can return books array after running add_author method' do
      @dpl.add_author(charlotte_bronte)
      @dpl.add_author(harper_lee)
      expect(@dpl.books).to eq([@villete, @professor, @jane_eyre, @mockingbird])
    end

    it 'can return a hash containing start and end times for an authors publications' do
      expect(@dpl.publication_time_frame_for(@harper_lee)).to eq({:start=>"1960", :end=>"1960"})
    end
  end
