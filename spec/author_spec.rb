require './lib/book'
require './lib/author'

RSpec.describe 'Author' do
  charlotte_bronte = Author.new(first_name = 'Charlotte', last_name = 'Bronte')
  it 'exists' do
    expect(charlotte_bronte).to be_an_instance_of(Author)
  end

  it 'has readable attributes' do
    expect(charlotte_bronte.name).to eq("Charlotte Bronte")
    expect(charlotte_bronte.books).to eq([])
  end

  it 'writes books' do
    charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    
    expect(charlotte_bronte.books[0]).to be_an_instance_of(Book)
  end
end