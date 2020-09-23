require "homework.rb"

describe "sum_to" do
  it "should calculate 1 through n" do
    expect(sum_to(5)).to eq(15)
    expect(sum_to(1)).to eq(1)
    expect(sum_to(9)).to eq(45)
    expect(sum_to(-8)).to eq(nil)
  end
end

describe "add_numbers" do
  it "should add numbers in array" do
    expect(add_numbers([1,2,3,4])).to eq(10)
    expect(add_numbers([3])).to eq(3)
    expect(add_numbers([-80,34,7])).to eq(-39)
    expect(add_numbers([])).to eq(nil)
  end
end