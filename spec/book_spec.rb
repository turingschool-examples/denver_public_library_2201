require 'pry'
require './lib/book'

RSpec.describe Book do

  before(:each)do
    @a = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
  end

  it 'exists' do
    expect(@a).to be_an_instance_of(Book)
  end

  it 'has attributes' do
    expect(@a.title).to eq("To Kill a Mockingbird")
    expect(@a.author).to eq("Harper Lee")
    expect(@a.publication_date).to eq("July 11, 1960")
  end

  it 'gets the publication year' do
    expect(@a.publication_year).to eq("1960")
  end
end
