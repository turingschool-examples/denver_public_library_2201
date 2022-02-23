require 'rspec'
require './lib/library'
require './lib/author'

RSpec.describe Library do
  it "exists" do
  dpl = Library.new("Denver Public Library")
  expect(dpl).to be_an_instance_of(Library)
  end

  it "has readable attributes" do
  dpl = Library.new("Denver Public Library")
  expect(dpl.name).to eq("Denver Public Library")
  end

  it "starts with empty arrays of books and authors" do
  dpl = Library.new("Denver Public Library")
  expect(dpl.books).to eq([])
  expect(dpl.authors).to eq([])
  end

  it "can add authors to the authors array" do

  dpl = Library.new("Denver Public Library")
  charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
  professor = charlotte_bronte.write("The Professor", "1857")
  villette = charlotte_bronte.write("Villette", "1853")
  harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
  mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
  dpl.add_author(charlotte_bronte)
  dpl.add_author(harper_lee)
  expect(dpl.authors).to eq([charlotte_bronte, harper_lee])
  end

  it "adds the books written by authors to the books array" do
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)
    dpl.add_books
    expect(dpl.books).to eq([charlotte_bronte, jane_eyre, professor, villette, mockingbird])
    end

end
