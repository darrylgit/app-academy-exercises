require "phase_4"

describe "mersenne_prime" do
  it " returns the n-th Mersenne prime" do
    expect(mersenne_prime(1)).to eq(3)
    expect(mersenne_prime(2)).to eq(7)
    expect(mersenne_prime(3)).to eq(31) 
    expect(mersenne_prime(4)).to eq(127) 
    expect(mersenne_prime(6)).to eq(131071)
  end
end