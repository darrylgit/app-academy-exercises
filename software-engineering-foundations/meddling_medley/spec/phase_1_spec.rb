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

describe "sentence_swap" do
  it "returns a new sentence where every word is replaced with it's corresponding value in the hash" do
    expect(sentence_swap('anything you can do I can do',
        'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
    )).to eq('nothing you shall drink I shall drink')
    
    expect(sentence_swap('what a sad ad',
        'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
    )).to eq('make a happy ad')
    
    expect(sentence_swap('keep coding okay',
        'coding'=>'running', 'kay'=>'pen'
    )).to eq('keep running okay')
  end
end

describe "hash_mapped" do
  let(:double) { Proc.new { |n| n * 2 } }
  let(:first) { Proc.new { |a| a[0] } }

  it "returns a new hash where each key is the result of the original key when given to the block and each value of the new hash should be the result of the original values when passed into the proc" do
    expect(hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }).to eq({"A!!"=>8, "X!!"=>14, "C!!"=>-6})
    expect(hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }).to eq({25=>"q", 36=>"w"})
  end
end