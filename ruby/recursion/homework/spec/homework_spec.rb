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

describe "gamma_fnc" do
  it "should do the gamma function which I guess is just the factorial of n - 1" do
    expect(gamma_fnc(0)).to eq(nil)
    expect(gamma_fnc(1)).to eq(1)
    expect(gamma_fnc(4)).to eq(6)
    expect(gamma_fnc(8)).to eq(5040)
  end
end

describe "ice_cream_shop" do
  it "tells if if we have the user's favorite ice cream flavor" do
    expect(ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')).to eq(false)
    expect(ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')).to eq(true)
    expect(ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')).to eq(false)
    expect(ice_cream_shop(['moose tracks'], 'moose tracks')).to eq(true)
    expect(ice_cream_shop([], 'honey lavender')).to eq(false)
  end
end