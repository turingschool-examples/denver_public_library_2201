require './lib/book'
require './lib/author'

  RSpec.describe Author do

    it 'author class exists' do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      expect(charlotte_bronte).to be_an_instance_of(Author)
    end

    it 'author has name' do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      expect(charlotte_bronte.name).to eq("Charlotte Bronte")
    end

    it 'author has an empty array of books' do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      expect(charlotte_bronte.books).to eq([])
    end

    it 'jane_eyre class has book' do #The write method must take two Strings as arguments and return an instance of Book
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      expect(jane_eyre.class).to be_an_instance_of(Book)
      expect(jane_eyre.title).to eq("Jane Eyre")
    end





  end
