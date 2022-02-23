require 'pry'
require './lib/book'
require './lib/author'

charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
#binding.pry
