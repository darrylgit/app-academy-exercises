require "phase_1"

describe "duos" do
  it "returns the count of the number of times the same character appears consecutively in the given string" do 
    expect(duos('bootcamp')).to eq(1)      
    expect(duos('wxxyzz')).to eq(2)        
    expect(duos('hoooraay')).to eq(3)      
    expect(duos('dinosaurs')).to eq(0)     
    expect(duos('e')).to eq(0)   
  end
end          