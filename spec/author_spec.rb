require 'pry'
require 'rspec'
require './lib/book'
require './lib/author'

RSpec.describe Book do
  before(:all) do
    @charlotte_bronte = Author.new({first_name: "Charlotte",
                                      last_name: "Bronte"})
  end

  describe "Object" do
    it "exists" do
        expect(@charlotte_bronte).to be_instance_of(Author)
    end

    it "has a name" do
      expect(@charlotte_bronte.name).to eq("Charlotte Bronte")
    end

    it "has books empty by default" do
        expect(@charlotte_bronte.books).to eq([])
    end

    it "#write" do
        jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")

          expect(jane_eyre).to be_instance_of(Book)
    end

        it "#books" do

#        jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
        villette = @charlotte_bronte.write("Villette", "1853")
        expect(@charlotte_bronte.books.length).to eq(2)
        end

   end
end
