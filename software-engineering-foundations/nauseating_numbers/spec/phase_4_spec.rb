require "phase_4"

# describe "mersenne_prime" do
#   it "returns the n-th Mersenne prime" do
#     expect(mersenne_prime(1)).to eq(3)
#     expect(mersenne_prime(2)).to eq(7)
#     expect(mersenne_prime(3)).to eq(31) 
#     expect(mersenne_prime(4)).to eq(127) 
#     expect(mersenne_prime(6)).to eq(131071)
#   end
# end

describe "triangular_word?" do
  it "returns a boolean indicating whether or not a word's number encoding is a triangular number" do
    expect(triangular_word?('abc')).to eq(true)       
    expect(triangular_word?('ba')).to eq(true)       
    expect(triangular_word?('lovely')).to eq(true)    
    expect(triangular_word?('question')).to eq(true)  
    expect(triangular_word?('aa')).to eq(false)        
    expect(triangular_word?('cd')).to eq(false)        
    expect(triangular_word?('cat')).to eq(false)       
    expect(triangular_word?('sink')).to eq(false)
  end
end  

describe "consecutive_collapse" do
  it "returns a new array that results from continuously removing consecutive numbers that are adjacent in the array" do
    expect(consecutive_collapse([3, 4, 1])).to eq([1])                     
    expect(consecutive_collapse([1, 4, 3, 7])).to eq([1, 7])                  
    expect(consecutive_collapse([9, 8, 2])).to eq([2])                     
    expect(consecutive_collapse([9, 8, 4, 5, 6])).to eq([6])               
    expect(consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])).to eq([1, 9, 2])   
    expect(consecutive_collapse([3, 5, 6, 2, 1])).to eq([1])               
    expect(consecutive_collapse([5, 7, 9, 9])).to eq([5, 7, 9, 9])                 
    expect(consecutive_collapse([13, 11, 12, 12])).to eq([])
  end
end              