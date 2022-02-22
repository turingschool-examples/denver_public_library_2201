require './spec/test_helper'
require './lib/author'
require './lib/library'

RSpec.describe 'Iteration 4' do
  before :each do
    @dpl = Library.new("Denver Public Library")
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    @villette = @charlotte_bronte.write("Villette", "1853")
    @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    @mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
  end

  it '1. Library #checked_out_books' do
    expect(@dpl).to respond_to(:checked_out_books).with(0).argument
    expect(@dpl.checked_out_books).to eq([])
  end

  it '2. Library #checkout' do
    expect(@dpl).to respond_to(:checkout).with(1).argument

    expect(@dpl.checkout(@mockingbird)).to eq(false)
    expect(@dpl.checkout(@jane_eyre)).to eq(false)

    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)

    expect(@dpl.checkout(@jane_eyre)).to eq(true)
    expect(@dpl.checkout(@villette)).to eq(true)
    expect(@dpl.checked_out_books).to eq([@jane_eyre, @villette])

    expect(@dpl.checkout(@jane_eyre)).to eq(false)
  end

  it '3. Library #return' do
    expect(@dpl).to respond_to(:return).with(1).argument

    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)

    @dpl.checkout(@jane_eyre)
    @dpl.checkout(@villette)
    @dpl.checkout(@mockingbird)

    @dpl.return(@villette)

    expect(@dpl.checked_out_books).to eq([@jane_eyre, @mockingbird])
  end

  it '4. Library #most_popular_book' do
    expect(@dpl).to respond_to(:most_popular_book).with(0).argument

    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)
    @dpl.checkout(@jane_eyre)
    @dpl.checkout(@jane_eyre)
    @dpl.return(@jane_eyre)
    @dpl.checkout(@jane_eyre)
    @dpl.checkout(@mockingbird)
    @dpl.return(@mockingbird)
    @dpl.checkout(@mockingbird)
    @dpl.return(@mockingbird)
    @dpl.checkout(@mockingbird)
    @dpl.checkout(@villette)

    expect(@dpl.most_popular_book).to eq(@mockingbird)
  end
end