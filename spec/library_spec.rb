require './lib/library'
require './lib/author'

RSpec.describe 'Library' do
  dpl = Library.new("Denver Public Library")
  
  it 'exists' do
    expect(dpl).to be_an_instance_of(Library)
  end

  it 'has readable attributes' do
    expect(dpl.name).to eq("Denver Public Library")
    expect(dpl.books).to eq([])
    expect(dpl.authors).to eq([])
  end
end