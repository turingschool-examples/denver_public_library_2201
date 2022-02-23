require './lib/book'
require './lib/author'


RSpec.describe Author do

  describe "Iteration 2" do

    it "exists" do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})   
      expect(charlotte_bronte).to be_an_instance_of(Author)
    end

  end


end
