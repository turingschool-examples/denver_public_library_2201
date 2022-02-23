require './lib/library'
require './lib/author'

RSpec.describe Library do

  context 'Iteration 3' do

    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})

    it 'exists' do
      expect(dpl.name).to eq("Denver Public Library")
      expect(dpl.books).to eq([])
      expect(dpl.authors).to eq([])
    end

    it 'can hold authors and books' do
      expect(dpl.authors).to eq([charlotte_bronte,harper_lee])
    end
  end
end
