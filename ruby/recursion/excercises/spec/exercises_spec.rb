require "exercises.rb"

describe "range" do
  it "returns an array of all numbers (exclusive) in range" do
    expect(range(1, 5)).to eq([1, 2, 3, 4])
    expect(range(5, 1)).to eq([])
  end
end

describe "array_sum_recursive" do
  it "sums all values in array" do
    expect(array_sum_recursive([1, 2, 3, 4])).to eq(10)
    expect(array_sum_recursive([1, 2, 3])).to eq(6)
    expect(array_sum_recursive([1])).to eq(1)
  end
end

describe "array_sum_iterative" do
  it "sums all values in array" do
    expect(array_sum_iterative([1, 2, 3, 4])).to eq(10)
    expect(array_sum_iterative([1, 2, 3])).to eq(6)
    expect(array_sum_iterative([1])).to eq(1)
  end
end