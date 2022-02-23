require './lib/book'
require './lib/author'
require './lib/library'
require 'pry'
require 'rspec'

RSpec.describe Library do
  let(:dpl) {Library.new("Denver Public Library")}
  let(:charlotte_bronte) {Author.new({first_name: "Charlotte", last_name: "Bronte"})}
  let(:jane_eyre) {charlotte_bronte.write("Jane Eyre", "October 16, 1847")}
  let(:professor) {charlotte_bronte.write("The Professor", "1857")}
  let(:villette) {charlotte_bronte.write("Villette", "1853")}
  let(:harper_lee) {Author.new({first_name: "Harper", last_name: "Lee"})}
  let(:mockingbird) {harper_lee.write("To Kill a Mockingbird", "July 11, 1960")}
  describe 'iteration 3' do
    it 'exists' do

      expect(dpl).to be_a(Library)
    end

    it 'can read the library name' do

      expect(dpl.name).to eq("Denver Public Library")
    end

    it 'can list its books and authors' do

      expect(dpl.books).to eq([])
      expect(dpl.authors).to eq([])
    end

    it 'can add authors and books' do
      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)

      expect(dpl.authors).to eq([charlotte_bronte, harper_lee])
      dpl.add_book(jane_eyre)
      dpl.add_book(professor)
      dpl.add_book(villette)
      dpl.add_book(mockingbird)
      expect(dpl.books).to eq([jane_eyre, professor, villette, mockingbird])
    end

    it 'can list publication timeframe' do

      expect(dpl.publication_time_frame_for(charlotte_bronte)).to eq({:start=>"1847", :end=>"1857"})
      expect(dpl.publication_time_frame_for(harper_lee)).to eq({:start=>"1960", :end=>"1960"})
    end
  end
end
