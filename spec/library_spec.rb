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

end
