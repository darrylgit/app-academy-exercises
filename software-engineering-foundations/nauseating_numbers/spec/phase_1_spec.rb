require "phase_1"

describe "strange_sums" do
  it "should return a count of the number of distinct pairs of elements that have a sum of zero" do
    expect(strange_sums([2, -3, 3, 4, -2])).to eq(2)     
    expect(strange_sums([42, 3, -1, -42])).to eq(1)      
    expect(strange_sums([-5, 5])).to eq(1)               
    expect(strange_sums([19, 6, -3, -20])).to eq(0)      
    expect(strange_sums([9])).to eq(0)
  end
end                 