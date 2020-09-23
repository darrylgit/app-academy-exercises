require "homework.rb"

describe "sum_to" do
  it "should calculate 1 through n" do
    expect(sum_to(5)).to eq(15)
    expect(sum_to(1)).to eq(1)
    expect(sum_to(9)).to eq(45)
    expect(sum_to(-8)).to eq(nil)
  end
end
