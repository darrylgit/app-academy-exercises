require "phase_2"

describe "anti_prime?" do
  it "returns true if the given number has more divisors than all positive numbers less than the given number" do
    expect(anti_prime?(24)).to eq(true) 
    expect(anti_prime?(36)).to eq(true) 
    expect(anti_prime?(48)).to eq(true) 
    expect(anti_prime?(360)).to eq(true) 
    expect(anti_prime?(1260)).to eq(true) 
    expect(anti_prime?(27)).to eq(false) 
    expect(anti_prime?(5)).to eq(false) 
    expect(anti_prime?(100)).to eq(false) 
    expect(anti_prime?(136)).to eq(false) 
    expect(anti_prime?(1024)).to eq(false) 
  end
end

describe "matrix_addition" do
  let(:matrix_a) { [[2,5], [4,7]] }
  let(:matrix_b) { [[9,1], [3,0]] }
  let(:matrix_c) { [[-1,0], [0,-1]] }
  let(:matrix_d) { [[2, -5], [7, 10], [0, 1]] }
  let(:matrix_e) { [[0 , 0], [12, 4], [6,  3]] }

  it "should add matrices, idk man" do
    expect(matrix_addition(matrix_a, matrix_b)).to eq([[11, 6], [7, 7]])  
    expect(matrix_addition(matrix_a, matrix_c)).to eq([[1, 5], [4, 6]])  
    expect(matrix_addition(matrix_b, matrix_c)).to eq([[8, 1], [3, -1]])  
    expect(matrix_addition(matrix_d, matrix_e)).to eq([[2, -5], [19, 14], [6, 4]]) 
  end
end

describe "mutual_factors" do
  it "as" do
    expect(mutual_factors(50, 30)).to eq([1, 2, 5, 10])             
    expect(mutual_factors(50, 30, 45, 105)).to eq([1, 5])   
    expect(mutual_factors(8, 4)).to eq([1, 2, 4])               
    expect(mutual_factors(8, 4, 10)).to eq([1, 2])          
    expect(mutual_factors(12, 24)).to eq([1, 2, 3, 4, 6, 12])            
    expect(mutual_factors(12, 24, 64)).to eq([1, 2, 4])        
    expect(mutual_factors(22, 44)).to eq([1, 2, 11, 22])             
    expect(mutual_factors(22, 44, 11)).to eq([1, 11])         
    expect(mutual_factors(7)).to eq([1, 7])                  
    expect(mutual_factors(7, 9)).to eq([1])              
  end
end