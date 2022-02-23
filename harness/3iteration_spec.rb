require './harness/test_helper'
require './lib/author'
require './lib/library'

RSpec.describe 'Iteration 3' do
  before :each do
    @dpl = Library.new("Denver Public Library")
  end

  it '1. Library Instantiation' do
    expect(Library).to respond_to(:new).with(1).argument
    expect(@dpl).to be_an_instance_of(Library)
  end

  it '2. Library #name' do
    expect(@dpl).to respond_to(:name).with(0).argument
    expect(@dpl.name).to eq('Denver Public Library')
  end

  it '3. Library #books' do
    expect(@dpl).to respond_to(:books).with(0).argument
    expect(@dpl.books).to eq([])
  end

  it '4. Library #authors' do
    expect(@dpl).to respond_to(:authors).with(0).argument
    expect(@dpl.authors).to eq([])
  end

  it '5. Library #add_author' do
    expect(@dpl).to respond_to(:add_author).with(1).argument
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    @dpl.add_author(charlotte_bronte)
    @dpl.add_author(harper_lee)

    expect(@dpl.authors).to eq([charlotte_bronte, harper_lee])
    expect(@dpl.books).to eq([jane_eyre, professor, villette, mockingbird])
  end

  it '6. Library #publication_time_frame_for' do
    expect(@dpl).to respond_to(:publication_time_frame_for).with(1).argument
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    expect(@dpl.publication_time_frame_for(charlotte_bronte)).to eq({:start=>"1847", :end=>"1857"})
    expect(@dpl.publication_time_frame_for(harper_lee)).to eq({:start=>"1960", :end=>"1960"})
  end
end