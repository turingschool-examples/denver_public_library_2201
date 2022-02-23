require 'rspec'
require './lib/book'
require './lib/author'
require './lib/library'

RSpec.describe Library do
  it "exists" do
    dpl = Library.new("Denver Public Library")

    expect(dpl).to be_an_instance_of(Library)
  end

  it "holds empty arrays of books and authors by default" do
    dpl = Library.new("Denver Public Library")

    expect(dpl.books).to eq([])
    expect(dpl.authors).to eq([])
  end
end
