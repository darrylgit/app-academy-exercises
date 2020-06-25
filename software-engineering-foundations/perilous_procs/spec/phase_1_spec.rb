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

describe "exactly?" do
  it "returns a boolean indicating whether or not there are exactly n elements that return true when given to the block" do
    expect(exactly?(['A', 'b', 'C'], 2) { |el| el == el.upcase }).to eq(true)         # true
    expect(exactly?(['A', 'B', 'C'], 2) { |el| el == el.upcase }).to eq(false)         # false
    expect(exactly?(['A', 'B', 'C'], 3) { |el| el == el.upcase }).to eq(true)         # true
    expect(exactly?(['cat', 'DOG', 'bird'], 1) { |el| el == el.upcase }).to eq(true)  # true
    expect(exactly?(['cat', 'DOG', 'bird'], 0) { |el| el == el.upcase }).to eq(false)  # false
    expect(exactly?(['cat', 'dog', 'bird'], 0) { |el| el == el.upcase }).to eq(true)  # true
    expect(exactly?([4, 5], 3) { |n| n > 0 }).to eq(false)                             # false
    expect(exactly?([4, 5, 2], 3) { |n| n > 0 }).to eq(true)                          # true
    expect(exactly?([42, -9, 7, -3, -6], 2) { |n| n > 0 }).to eq(true)                # true
  end
end

describe "filter_out" do
  it "returns a new array where elements of the original array are removed if they return true when given to the block" do
    expect(filter_out([10, 6, 3, 2, 5 ]) { |x| x.odd? }).to eq([10, 6, 2])     
    expect(filter_out([1, 7, 3, 5 ]) { |x| x.odd? }).to eq([])          
    expect(filter_out([10, 6, 3, 2, 5 ]) { |x| x.even? }).to eq([3, 5])     
    expect(filter_out([1, 7, 3, 5 ]) { |x| x.even? }).to eq([1, 7, 3, 5]) 
  end
end 

describe "at_least?" do
  it "returns a boolean indicating whether or not at least n elements of the array return true when given to the block" do
    expect(at_least?(['sad', 'quick', 'timid', 'final'], 2) { |s| s.end_with?('ly') }).to eq(false)
    expect(at_least?(['sad', 'quickly', 'timid', 'final'], 2) { |s| s.end_with?('ly') }).to eq(false)
    expect(at_least?(['sad', 'quickly', 'timidly', 'final'], 2) { |s| s.end_with?('ly') }).to eq(true)
    expect(at_least?(['sad', 'quickly', 'timidly', 'finally'], 2) { |s| s.end_with?('ly') }).to eq(true)
    expect(at_least?(['sad', 'quickly', 'timid', 'final'], 1) { |s| s.end_with?('ly') }).to eq(true)
    expect(at_least?(['sad', 'quick', 'timid', 'final'], 1) { |s| s.end_with?('ly') }).to eq(false)
    expect(at_least?([false, false, false], 3) { |bool| bool }).to eq(false)
    expect(at_least?([false, true, true], 3) { |bool| bool }).to eq(false)
    expect(at_least?([true, true, true], 3) { |bool| bool }).to eq(true)
    expect(at_least?([true, true, true, true], 3) { |bool| bool }).to eq(true)
  end
end

describe "every?" do
  it "returns a boolean indicating whether or not all elements of the array return true when given to the block" do
    expect(every?([3, 1, 11, 5]) { |n| n.even? }).to eq(false)                                
    expect(every?([2, 4, 4, 8]) { |n| n.even? }).to eq(true)                                  
    expect(every?([8, 2]) { |n| n.even? }).to eq(true)                                        
    expect(every?(['squash', 'corn', 'kale', 'carrot']) { |str| str[0] == 'p' }).to eq(false)  
    expect(every?(['squash', 'pea', 'kale', 'potato']) { |str| str[0] == 'p' }).to eq(false)   
    expect(every?(['parsnip', 'potato', 'pea']) { |str| str[0] == 'p' }).to eq(true)
  end
end          


describe "at most?" do 
  it "returns a boolean indicating whether no more than n elements of the array return true when given to the block" do
    expect(at_most?([-4, 100, -3], 1) { |el| el > 0 }).to eq(true)                         # true
    expect(at_most?([-4, -100, -3], 1) { |el| el > 0 }).to eq(true)                        # true
    expect(at_most?([4, 100, -3], 1) { |el| el > 0 }).to eq(false)                          # false
    expect(at_most?([4, 100, 3], 1) { |el| el > 0 }).to eq(false)                           # false
    expect(at_most?(['r', 'q', 'e', 'z'], 2) { |el| 'aeiou'.include?(el) }).to eq(true)    # true
    expect(at_most?(['r', 'i', 'e', 'z'], 2) { |el| 'aeiou'.include?(el) }).to eq(true)    # true
    expect(at_most?(['r', 'i', 'e', 'o'], 2) { |el| 'aeiou'.include?(el) }).to eq(false)    # false
  end
end
