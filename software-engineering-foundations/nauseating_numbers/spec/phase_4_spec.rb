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