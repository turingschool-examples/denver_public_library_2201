require './harness/test_helper'
require './lib/book'

RSpec.describe 'Iteration 1' do
  before :each do
    @book = Book.new({
      author_first_name: "Harper",
      author_last_name: "Lee",
      title: "To Kill a Mockingbird",
      publication_date: "July 11, 1960"
    })
  end

  it '1. Book Instantiation' do
    expect(Book).to respond_to(:new).with(1).argument
    expect(@book).to be_an_instance_of(Book)
  end

  it '2. Book #title' do
    expect(@book).to respond_to(:title).with(0).argument
    expect(@book.title).to eq('To Kill a Mockingbird')
  end

  it '3. Book #author' do
    expect(@book).to respond_to(:author).with(0).argument
    expect(@book.author).to eq('Harper Lee')
  end

  it '4. Book #publication_year' do
    expect(@book).to respond_to(:publication_year).with(0).argument
    expect(@book.publication_year).to eq('1960')
  end
end