require "problems"

describe "no dupes" do
  it "should remove duplicate numbers" do
    expect(no_dupes?([1, 1, 2, 1, 3, 2, 4]) ).to eq([3, 4])
  end

  it "should remove duplicate strings" do
    expect(no_dupes?(['x', 'x', 'y', 'z', 'z'])).to eq(['y'])
  end

  it "should remove duplicate booleans" do
    expect(no_dupes?([true, true, true])).to eq([])
  end
end

describe "no consecutive repeats" do
  it "should return true if there no repeats" do
    expect(no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])).to eq(true)
    expect(no_consecutive_repeats?([10, 42, 3, 7, 10, 3])).to eq(true)
    expect(no_consecutive_repeats?(['x'])).to eq(true)
  end

  it "should return false if there are repeats" do
    expect(no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])).to eq(false)
    expect(no_consecutive_repeats?([10, 42, 3, 3, 10, 3])).to eq(false)
  end
end

describe "char indices" do
  it "should return a hash of indices with characters as keys" do
    expect(char_indices('mississippi')).to eq({"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]})
    expect(char_indices('classroom')).to eq({"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]})
  end
end
