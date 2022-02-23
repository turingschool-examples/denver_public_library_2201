require './lib/book'
require './lib/author'

RSpec.describe Author do

  charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

  it 'exists' do
    expect(charlotte_bronte).to be_an_instance_of(Author)
  end

  it 'has readable #name' do
    expect(charlotte_bronte.name).to eq("Charlotte Bronte")
  end

  it 'has empty #books array' do
    expect(charlotte_bronte.books).to eq([])
  end

  it 'it can #writee a book' do
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = charlotte_bronte.write("Villette", "febuary 15, 1853")
    expect(villette).to be_an_instance_of(Book)
    expect(jane_eyre).to be_an_instance_of(Book)
    expect(jane_eyre.title).to eq("Jane Eyre")
    expect(jane_eyre.class).to eq(Book)

    expect(charlotte_bronte.books).to eq([jane_eyre, villette])


  end


end
