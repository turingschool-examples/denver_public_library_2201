require './lib/library'
require './lib/author'
require './lib/book'
require 'pry'

describe Library do
  dpl = Library.new("Denver Public Library")

  it "exists" do
    expect(dpl).to be_an_instance_of(Library)
  end

  it "has a name" do
    expect(dpl.name).to eq("Denver Public Library")
  end

  it "has books and authors" do
    expect(dpl.books).to eq([])
    expect(dpl.authors).to eq([])
  end

  charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
  professor = charlotte_bronte.write("The Professor", "1857")
  villette = charlotte_bronte.write("Villette", "1853")
  harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
  mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

  it "can add authors and books" do
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)
    expect(dpl.authors).to eq([charlotte_bronte, harper_lee])
    expect(dpl.books).to eq([jane_eyre, villette, professor, mockingbird])
  end

  it "can determine a publication time frame" do
    expect(dpl.publication_time_frame_for(charlotte_bronte)).to eq({:start=>"1847", :end=>"1857"})
    expect(dpl.publication_time_frame_for(harper_lee)).to eq({:start=>"1960", :end=>"1960"})
  end
end

describe Library do
  dpl = Library.new("Denver Public Library")

  charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
  villette = charlotte_bronte.write("Villette", "1853")
  harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
  mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

  it "cannot checkout if the library doesn't have the book" do
    expect(dpl.checkout(mockingbird)).to be false
    expect(dpl.checkout(jane_eyre)).to be false
  end

  it "can checkout books it has" do
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)
    expect(dpl.checkout(jane_eyre)).to be true
    expect(dpl.checked_out_books).to eq([jane_eyre])
  end

  it "cannot checkout checked out books" do
    expect(dpl.checkout(jane_eyre)).to be false
    expect(dpl.checkout(mockingbird)).to be true
    expect(dpl.checkout(mockingbird)).to be false
  end
end
