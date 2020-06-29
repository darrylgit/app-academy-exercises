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