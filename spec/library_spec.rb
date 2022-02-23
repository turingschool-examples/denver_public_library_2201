require './lib/library'
require './lib/author'

describe Library do
  dpl = Library.new("Denver Public Library")

  it "exists" do
    expect(dpl).to be_an_instance_of(Library)
  end
  
end
