require 'pry'
require './lib/book'
require './lib/author'
require './lib/library'

RSpec.describe Library do

  before(:each) do
    @dpl = Library.new("Denver Public Library")
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    @professor = @charlotte_bronte.write("The Professor", "1857")
    @villette = @charlotte_bronte.write("Villette", "1853")
    @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    @mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
  end

  it 'exists' do
    expect(@dpl).to be_an_instance_of(Library)
  end

  it 'has attributes' do
    expect(@dpl.name).to eq("Denver Public Library")
    expect(@dpl.books).to eq([])
    expect(@dpl.authors).to eq([])
  end

  it 'adds authors to the library catalog' do
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)
    binding.pry
    expect(@dpl.authors).to eq([@charlotte_bronte, @harper_lee])
  end

  it 'adds the authors books to the library catalog' do
    @dpl.add_author(@harper_lee)
    @dpl.add_author(@charlotte_bronte)
    binding.pry
    expect(@dpl.books.length).to eq(4)
  end


end
