require "phase_1"

describe "strange_sums" do
  it "returns a count of the number of distinct pairs of elements that have a sum of zero" do
    expect(strange_sums([2, -3, 3, 4, -2])).to eq(2)     
    expect(strange_sums([42, 3, -1, -42])).to eq(1)      
    expect(strange_sums([-5, 5])).to eq(1)               
    expect(strange_sums([19, 6, -3, -20])).to eq(0)      
    expect(strange_sums([9])).to eq(0)
  end
end 

describe "pair_product" do
  it "returns a boolean indicating whether a pair of distinct elements in the array result in the product when multiplied together" do
    expect(pair_product([4, 2, 5, 8], 16)).to eq(true)
    expect(pair_product([8, 1, 9, 3], 8)).to eq(true)
    expect(pair_product([3, 4], 12)).to eq(true)
    expect(pair_product([3, 4, 6, 2, 5], 12)).to eq(true)
    expect(pair_product([4, 2, 5, 7], 16)).to eq(false)
    expect(pair_product([8, 4, 9, 3], 8)).to eq(false)
    expect(pair_product([3], 12)).to eq(false)
  end
end

describe "rampant_repeats" do
  it "returns a new string where chacaters of the original string are repeated the number of times specified by the hash" do
    expect(rampant_repeats('taco', {'a'=>3, 'c'=>2})).to eq('taaacco')             
    expect(rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3})).to eq('ffffeeveerisssh') 
    expect(rampant_repeats('misispi', {'s'=>2, 'p'=>2})).to eq('mississppi')          
    expect(rampant_repeats('faarm', {'e'=>3, 'a'=>2})).to eq('faaaarm')
  end
end           