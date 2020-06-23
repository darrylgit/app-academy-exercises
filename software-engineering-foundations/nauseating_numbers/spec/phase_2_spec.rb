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