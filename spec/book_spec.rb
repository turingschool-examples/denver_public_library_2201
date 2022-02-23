require 'RSpec'
#require_relative 'spec_helper'
require './lib/book'


Rspec.describe Book do
  it 'can return the author first name, last name, title and pub date' do
    book-spec = Book.new({:authFN => "Speccy", :authLN => "Testerson", 
    :ttl => "To Test or not to Test", :pub_date => "January 01, 1900"})
      expect(book.authFN).to eq("Speccy")
    end
end
