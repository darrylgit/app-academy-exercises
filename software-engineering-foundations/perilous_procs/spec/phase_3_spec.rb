require "phase_3"

describe "selected_map!" do
  let(:is_even) { Proc.new { |n| n.even? } } 
  let(:is_positive) { Proc.new { |n| n > 0 } } 
  let(:square) { Proc.new { |n| n * n } } 
  let(:flip_sign) { Proc.new { |n| -n } } 

  let(:arr_1) { [8, 5, 10, 4] }
  let(:arr_2) { [-10, 4, 7, 6, -2, -9] }
  let(:arr_3) { [-10, 4, 7, 6, -2, -9] }

  it "replaces the elements that return true when passed into the first proc with their return values when they are passed into the second proc" do
    
    expect(selected_map!(arr_1, is_even, square)).to eq(nil)     
    expect(arr_1).to eq([64, 5, 100, 16])                                     

    
    expect(selected_map!(arr_2, is_even, flip_sign)).to eq(nil)
    expect(arr_2).to eq([10, -4, 7, -6, 2, -9])                                     

    
    expect(selected_map!(arr_3, is_positive, square)).to eq(nil) 
    expect(arr_3).to eq([-10, 16, 49, 36, -2, -9])                                     
  end
end

describe "chain_map" do 
  let(:add_5) { Proc.new { |n| n + 5 } } 
  let(:half) { Proc.new { |n| n / 2.0 } } 
  let(:square) { Proc.new { |n| n * n } } 

  it "returns the final result of feeding the value through all of the proc" do
    expect(chain_map(25, [add_5, half])).to eq(15.0)         
    expect(chain_map(25, [half, add_5])).to eq(17.5)         
    expect(chain_map(25, [add_5, half, square])).to eq(225) 
    expect(chain_map(4, [square, half])).to eq(8)         
    expect(chain_map(4, [half, square])).to eq(4)
  end
end         