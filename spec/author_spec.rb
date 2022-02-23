require 'pry'
require './lib/book'
require './lib/author'

RSpec.describe Author do
  context 'Iteration 2' do
    before(:each) do
      @charlotte_bronte = Author.new({
                                       first_name: 'Charlotte',
                                       last_name: 'Bronte'
                                     })
    end

    it 'exists' do
      expect(@charlotte_bronte).to be_an_instance_of(Author)
    end

    it 'can tell name' do
      expect(@charlotte_bronte.name).to eq('Charlotte Bronte')
    end

    it 'can hold books' do
      expect(@charlotte_bronte.books).to eq([])
    end

    it 'knows a book' do
      @jane_eyre = @charlotte_bronte.write('Jane Eyre', 'October 16, 1847')
      @villette = @charlotte_bronte.write('Villette', '1853')
      expect(@jane_eyre.class).to be_an_instance_of(Book)
    end

    it '' do
    end
  end
end
