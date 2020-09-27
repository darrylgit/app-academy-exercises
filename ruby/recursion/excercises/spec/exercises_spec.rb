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

describe "exp_1" do
  it "exponentiates stuff" do
    expect(exp_1(2, 1)).to eq(2)
    expect(exp_1(3, 1)).to eq(3)
    expect(exp_1(3, 2)).to eq(9)
    expect(exp_1(3, 3)).to eq(27)
    expect(exp_1(2, 3)).to eq(8)
  end
end

describe "exp_2" do
  it "exponentiates stuff all fancy shmancy" do
    expect(exp_2(2, 1)).to eq(2)
    expect(exp_2(3, 0)).to eq(1)
    expect(exp_2(3, 2)).to eq(9)
    expect(exp_2(3, 3)).to eq(27)
    expect(exp_2(2, 3)).to eq(8)
  end
end

describe "deep_dup" do 
  it "deeply duplicates an array" do
    robot_parts = [
      ["nuts", "bolts", "washers"],
      ["capacitors", "resistors", "inductors"]
    ]

    # robot_parts_copy = robot_parts.deep_dup
    robot_parts_copy = robot_parts.deep_dup


    robot_parts_copy[1] << "LEDs"

    expect(robot_parts_copy[1]).to eq(["capacitors", "resistors", "inductors", "LEDs"])
    expect(robot_parts[1]).to eq(["capacitors", "resistors", "inductors"])


  end
end

describe "fibonacci" do 
  it "returns a fibonacci array" do
    expect(fibonacci(0)).to eq([])
    expect(fibonacci(1)).to eq([1])
    expect(fibonacci(6)).to eq([1, 1, 2, 3, 5, 8])
    expect(fibonacci(8)).to eq([1, 1, 2, 3, 5, 8, 13, 21])
  end
end

describe "binary search" do
  it "returns an index using binary search" do
    # expect(bsearch([1, 2, 3], 1)).to eq(0)
    # expect(bsearch([2, 3, 4, 5], 3)).to eq(1)
    # expect(bsearch([2, 4, 6, 8, 10], 6)).to eq(2)
    expect(bsearch([1, 3, 4, 5, 9], 5)).to eq(3)
    expect(bsearch([1, 2, 3, 4, 5, 6], 6)).to eq(5)
    expect(bsearch([1, 2, 3, 4, 5, 6], 0)).to eq(nil)
    expect(bsearch([1, 2, 3, 4, 5, 7], 6)).to eq(nil)
  end
end