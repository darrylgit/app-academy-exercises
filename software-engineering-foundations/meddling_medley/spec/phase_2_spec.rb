require "phase_2"

describe "conjunct_select" do
  let(:is_positive) { Proc.new { |n| n > 0 } } 
  let(:is_odd) { Proc.new { |n| n.odd? } }
  let(:less_than_ten) { Proc.new { |n| n < 10 } }

  it "returns a new array containing the elements that return true when passed into all of the given procs" do
    expect(conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive)).to eq([4, 8, 11, 7, 13])
    expect(conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd)).to eq([11, 7, 13])
    expect(conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten)).to eq([7])
  end
end

describe "convert_pig_latin" do
  it "translates the sentence into pig latin" do
    expect(convert_pig_latin('We like to eat bananas')).to eq("We ikelay to eatyay ananasbay")
    expect(convert_pig_latin('I cannot find the trash')).to eq("I annotcay indfay ethay ashtray")
    expect(convert_pig_latin('What an interesting problem')).to eq("Atwhay an interestingyay oblempray")
    expect(convert_pig_latin('Her family flew to France')).to eq("Erhay amilyfay ewflay to Ancefray")
    expect(convert_pig_latin('Our family flew to France')).to eq("Ouryay amilyfay ewflay to Ancefray")
  end
end

describe "reverberate" do
  it "reverberates the sentence" do
    expect(reverberate('We like to go running fast')).to eq("We likelike to go runninging fastast")
    expect(reverberate('He cannot find the trash')).to eq("He cannotot findind thethe trashash")
    expect(reverberate('Pasta is my favorite dish')).to eq("Pastapasta is my favoritefavorite dishish")
    expect(reverberate('Her family flew to France')).to eq("Herer familyily flewew to Francefrance")
  end
end
