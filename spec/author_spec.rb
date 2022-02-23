require './lib/book'
require './lib/author'

describe Author do
  charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

  it "Exists" do
    expect(charlotte_bronte).to be_an_instance_of(Author)
  end
end
