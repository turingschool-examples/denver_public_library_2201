require './spec/test_helper'
require './lib/book'
require './lib/author'

RSpec.describe 'Iteration 2' do
  before :each do
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  it '1. Author Instantiation' do
    expect(Author).to respond_to(:new).with(1).argument
    expect(@charlotte_bronte).to be_an_instance_of(Author)
  end

  it '2. Author #name' do
    expect(@charlotte_bronte).to respond_to(:name).with(0).argument
    expect(@charlotte_bronte.name).to eq('Charlotte Bronte')
  end

  it '3. Author #books' do
    expect(@charlotte_bronte).to respond_to(:books).with(0).argument
    expect(@charlotte_bronte.books).to eq([])
  end

  it '4. Author #write' do
    expect(@charlotte_bronte).to respond_to(:write).with(2).argument
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    expect(jane_eyre).to be_an_instance_of(Book)
    expect(jane_eyre.title).to eq('Jane Eyre')
    expect(jane_eyre.publication_year).to eq('1847')
    expect(@charlotte_bronte.books).to eq([jane_eyre])
    villette = @charlotte_bronte.write("Villette", "1853")
    expect(villette.title).to eq('Villette')
    expect(villette.publication_year).to eq('1853')
    expect(@charlotte_bronte.books).to eq([jane_eyre, villette])
  end
end