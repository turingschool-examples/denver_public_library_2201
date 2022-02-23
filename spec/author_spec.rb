require './lib/book'
require './lib/author'


RSpec.describe Author do

  describe "Iteration 2" do

    it "exists" do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      expect(charlotte_bronte).to be_an_instance_of(Author)
    end

    it "has a name" do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      expect(charlotte_bronte.name).to eq("Charlotte Bronte")
    end

    it "has zero books by default" do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      expect(charlotte_bronte.books).to eq([])
    end

    it "can add books" do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      # require 'pry'; binding.pry
      expect(jane_eyre.class).to be(Book)
    end



  end


end
