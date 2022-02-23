require './lib/book'
require './lib/author'
require './lib/Library'

RSpec.describe Library do
  before(:each) do
    @dpl = Library.new("Denver Public Library")
  end

    it "exists" do
      expect(@dpl).to be_an_instance_of(Library)
    end

    it "has a name" do
      expect(@dpl.name).to eq("Denver Public Library")
    end

    it "has no books when initialized" do
      expect(@dpl.books).to eq([])
    end

    it "has no authors listed when initialized" do
      expect(@dpl.authors).to eq([])
    end
end
