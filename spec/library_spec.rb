require './lib/library'
require './lib/author'

RSpec.describe Library do
  it "has attributes" do
    dpl = Library.new("Denver Public Library")

    expect(dpl.name).to eq("Denver Public Library")
    expect(dpl.books).to eq([])
    expect(dpl.authors).to eq([])
  end

  it "can add books and authors" do
    dpl = Library.new("Denver Public Library")

    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    expect(dpl.authors).to eq([charlotte_bronte, harper_lee])
    expect(dpl.books).to eq([jane_eyre, professor, villette, mockingbird])
  end

  it "can find publication time frames" do
    dpl = Library.new("Denver Public Library")

    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    expect(dpl.publication_time_frame_for(charlotte_bronte)).to eq({:start => "1847", :end => "1857"})
    expect(dpl.publication_time_frame_for(harper_lee)).to eq({:start => "1960", :end => "1960"})
  end

  it "can checkout and return books" do
    dpl = Library.new("Denver Public Library")

    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    expect(dpl.checkout(mockingbird)).to be false
    expect(dpl.checkout(jane_eyre)).to be false

    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)
    expect(dpl.checkout(jane_eyre)).to be true
    expect(dpl.checked_out_books).to eq([jane_eyre])
    expect(dpl.checkout(jane_eyre)).to be false

    dpl.return(jane_eyre)
    expect(dpl.checked_out_books).to eq([])
    expect(dpl.checkout(jane_eyre)).to be true
    expect(dpl.checkout(villette)).to be true
    expect(dpl.checked_out_books).to eq([jane_eyre, villette])
  end

  xit "can find the most popular book" do
    dpl = Library.new("Denver Public Library")

    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    expect(dpl.checkout(mockingbird)).to be false
    expect(dpl.checkout(jane_eyre)).to be false

    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)
    expect(dpl.checkout(jane_eyre)).to be true
    expect(dpl.checked_out_books).to eq([jane_eyre])
    expect(dpl.checkout(jane_eyre)).to be false

    dpl.return(jane_eyre)
    expect(dpl.checked_out_books).to eq([])
    expect(dpl.checkout(jane_eyre)).to be true
    expect(dpl.checkout(villette)).to be true
    expect(dpl.checked_out_books).to eq([jane_eyre, villette])

    dpl.checkout(mockingbird)
    dpl.return(mockingbird)
    dpl.checkout(mockingbird)
    dpl.return(mockingbird)
    dpl.checkout(mockingbird)
    expect(dpl.most_popular_book).to eq([mockingbird])
  end
end
