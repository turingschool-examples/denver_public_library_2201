require './lib/book'
require './lib/author'

RSpec.describe Author do
  before(:each) do

    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end
  it "exists" do
    expect(@charlotte_bronte).to be_an_instance_of(Author)
  end



end
