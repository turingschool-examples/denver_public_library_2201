require './lib/book'
require './lib/author'

RSpec.describe Author do
  it "has attributes" do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    expect(charlotte_bronte.name).to eq("Charlotte Bronte")
    expect(charlotte_bronte.books).to eq([])
  end
end
