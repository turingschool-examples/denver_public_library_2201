require './lib/book'
require './lib/author'
require './lib/library'

RSpec.describe Library do
  let(:dpl) {Library.new("Denver Public Library")}
  let(:charlotte_bronte) {Author.new({ first_name: "Charlotte", last_name: "Bronte" })}
  let(:harper_lee) {Author.new({ first_name: "Harper", last_name: "Lee" })}
  let(:jane_eyre) {Book.new("Jane Eyre", "October 16, 1847")}
  let(:professor) {Book.new("The Professor", "1857") }
  let(:villette) {Book.new("Villette", "1853") }
  let(:mockingbird) {Book.new("To Kill a Mockingbird", "July 11, 1960") }

  it 'exists' do
    expect(dpl).to be_a(Library)

  end

  it 'has attributes' do
    expect(dpl.name).to eq("Denver Public Library")
    expect(dpl.books).to eq([])
    expect(dpl.authors).to eq([])
  end

  it 'can add authors' do
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    expect(dpl.authors).to eq([charlotte_bronte, harper_lee])
  end

  it 'can add books of authors' do
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    expect(dpl.books).to eq([jane_eyre, professor, villette, mockingbird])
  end

  it 'can return publication_time_frame_for_author' do
    bronte_hash = {:start => "1847", :end => "1857"}
    expect(dpl.publication_time_frame_for(charlotte_bronte)).to eq(bronte_hash)

    lee_hash = {:start => "1960", :end => "1960"}
    expect(dpl.publication_time_frame_for(harper_lee)).to eq(lee_hash)
  end
end
