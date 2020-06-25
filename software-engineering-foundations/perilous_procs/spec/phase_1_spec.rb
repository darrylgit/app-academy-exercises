require "phase_1"

describe "some?" do
  it "returns a boolean indicating whether or not at least one of the elements of the array returns true when given to the block" do
    expect(some?([3, 1, 11, 5]) { |n| n.even? }).to eq(false)                                #
    expect(some?([3, 4, 11, 5]) { |n| n.even? }).to eq(true)                                
    expect(some?([8, 2]) { |n| n.even? }).to eq(true)                                       
    expect(some?(['squash', 'corn', 'kale', 'carrot']) { |str| str[0] == 'p' }).to eq(false) 
    expect(some?(['squash', 'corn', 'kale', 'potato']) { |str| str[0] == 'p' }).to eq(true) 
    expect(some?(['parsnip', 'lettuce', 'pea']) { |str| str[0] == 'p' }).to eq(true)        
  end
end
