require "exercises.rb"

describe "range" do
  it "returns an array of all numbers (exclusive) in range" do
    expect(range(1, 5)).to eq([1, 2, 3, 4])
    expect(range(5, 1)).to eq([])
  end
end