require "phase_2"

describe "xnor_select" do
  let(:is_even) { Proc.new { |n| n % 2 == 0 } }
  let(:is_odd) { Proc.new { |n| n % 2 != 0 } }
  let(:is_positive) { Proc.new { |n| n > 0 } }

  it "returns a new array containing elements of the original array that either return true for both procs or return false for both procs" do
    expect(xnor_select([8, 3, -4, -5], is_even, is_positive)).to eq([8, -5])         
    expect(xnor_select([-7, -13, 12, 5, -10], is_even, is_positive)).to eq([-7, -13, 12])  
    expect(xnor_select([-7, -13, 12, 5, -10], is_odd, is_positive)).to eq([5, -10])
  end
end
