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

describe "disjunct_select" do
  let(:longer_four) { Proc.new { |s| s.length > 4 } }
  let(:contains_o) { Proc.new { |s| s.include?('o') } }
  let(:starts_a) { Proc.new { |s| s[0] == 'a' } }

  it "return a new array containing the elements that return true when passed into at least one of the given procs" do
    expect(disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
        longer_four,
    )).to eq(["apple", "teeming"])

    expect(disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
        longer_four,
        contains_o
    )).to eq(["dog", "apple", "teeming", "boot"])

    expect(disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
        longer_four,
        contains_o,
        starts_a
    )).to eq(["ace", "dog", "apple", "teeming", "boot"])
  end
end

describe "alternating_vowel" do
  it "returns a new sentence where the words alternate between having their first or last vowel removed" do
    expect(alternating_vowel('panthers are great animals')).to eq("pnthers ar grat animls")
    expect(alternating_vowel('running panthers are epic')).to eq("rnning panthrs re epc")
    expect(alternating_vowel('code properly please')).to eq("cde proprly plase")
    expect(alternating_vowel('my forecast predicts rain today')).to eq("my forecst prdicts ran tday")
  end
end

describe "silly_talk" do
  it "makes the sentence into silly talk" do
    expect(silly_talk('Kids like cats and dogs')).to eq("Kibids likee cabats aband dobogs")
    expect(silly_talk('Stop that scooter')).to eq("Stobop thabat scobooboteber")
    expect(silly_talk('They can code')).to eq("Thebey caban codee")
    expect(silly_talk('He flew to Italy')).to eq("Hee flebew too Ibitabaly")
  end
end

describe "compress" do
  it "returns a 'compressed' version of the string" do
    expect(compress('aabbbbc')).to eq("a2b4c")
    expect(compress('boot')).to eq("bo2t")
    expect(compress('xxxyxxzzzz')).to eq("x3yx2z4")
  end
end

