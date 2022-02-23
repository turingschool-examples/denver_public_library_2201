require './lib/book'
require './lib/author'

RSpec.describe Author do
  let(:charlotte_bronte) {
    Author.new({first_name: "Charlotte", last_name: "Bronte"})
  }
  it 'exists' do
    expect(charlotte_bronte).to be_a(Author)
  end

  it "can return the author name" do
    expect(charlotte_bronte.name).to eq("Charlotte Bronte")
  end

  it 'can have a books array' do
  expect(charlotte_bronte.books).to eq([])
end

it 'can write a book to add to books array' do
  jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
  expect(jane_eyre.class)to be_a(Book)
  expect(jane_eyre.title)to eq("Jane Eyre")

villette = charlotte_bronte.write("Villette", "1853")
expect(charlotte_bronte.books).to eq([jane_eyre, villette])

end




end
