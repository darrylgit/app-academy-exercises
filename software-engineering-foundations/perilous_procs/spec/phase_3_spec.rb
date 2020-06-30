require "phase_3"

describe "selected_map!" do
  let(:is_even) { Proc.new { |n| n.even? } } 
  let(:is_positive) { Proc.new { |n| n > 0 } } 
  let(:square) { Proc.new { |n| n * n } } 
  let(:flip_sign) { Proc.new { |n| -n } } 

  let(:arr_1) { [8, 5, 10, 4] }
  let(:arr_2) { [-10, 4, 7, 6, -2, -9] }
  let(:arr_3) { [-10, 4, 7, 6, -2, -9] }

  it "replaces the elements that return true when passed into the first proc with their return values when they are passed into the second proc" do
    
    expect(selected_map!(arr_1, is_even, square)).to eq(nil)     
    expect(arr_1).to eq([64, 5, 100, 16])                                     

    
    expect(selected_map!(arr_2, is_even, flip_sign)).to eq(nil)
    expect(arr_2).to eq([10, -4, 7, -6, 2, -9])                                     

    
    expect(selected_map!(arr_3, is_positive, square)).to eq(nil) 
    expect(arr_3).to eq([-10, 16, 49, 36, -2, -9])                                     
  end
end

describe "chain_map" do 
  let(:add_5) { Proc.new { |n| n + 5 } } 
  let(:half) { Proc.new { |n| n / 2.0 } } 
  let(:square) { Proc.new { |n| n * n } } 

  it "returns the final result of feeding the value through all of the proc" do
    expect(chain_map(25, [add_5, half])).to eq(15.0)         
    expect(chain_map(25, [half, add_5])).to eq(17.5)         
    expect(chain_map(25, [add_5, half, square])).to eq(225) 
    expect(chain_map(4, [square, half])).to eq(8)         
    expect(chain_map(4, [half, square])).to eq(4)
  end
end         

describe "proc_suffix" do
  let(:contains_a) { Proc.new { |w| w.include?('a') } } 
  let(:three_letters) { Proc.new { |w| w.length == 3 } } 
  let(:four_letters) { Proc.new { |w| w.length == 4 } } 

  it "returns a new sentence where each word of the original sentence is appended with a suffix if the original word returns true when given to the corresponding proc key" do
    expect(proc_suffix('dog cat',
        contains_a => 'ly',
        three_letters => 'o'
    )).to eq("dogo catlyo")   

    expect(proc_suffix('dog cat',
        three_letters => 'o',
        contains_a => 'ly'
    )).to eq("dogo catoly")   

    expect(proc_suffix('wrong glad cat',
        contains_a => 'ly',
        three_letters => 'o',
        four_letters => 'ing'
    )).to eq("wrong gladlying catlyo")   

    expect(proc_suffix('food glad rant dog cat',
        four_letters => 'ing',
        contains_a => 'ly',
        three_letters => 'o'
    )).to eq("fooding gladingly rantingly dogo catlyo")   
  end
end

describe "proctition_platinum" do
  let(:is_yelled) { Proc.new { |s| s[-1] == '!' } } 
  let(:is_upcase) { Proc.new { |s| s.upcase == s } } 
  let(:contains_a) { Proc.new { |s| s.downcase.include?('a') } } 
  let(:begins_w) { Proc.new { |s| s.downcase[0] == 'w' } } 

  it "return a hash where the keys correspond to the number of procs passed in" do
    expect(proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, contains_a)).to eq({1=>["when!", "WHERE!"], 2=>["what"]})
    
    expect(proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, is_upcase, contains_a)).to eq({1=>["when!", "WHERE!"], 2=>["WHO", "WHY"], 3=>["what"]})
    
    expect(proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_upcase, is_yelled, contains_a)).to eq({1=>["WHO", "WHERE!", "WHY"], 2=>["when!"], 3=>["what"]})
    
    expect(proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], begins_w, is_upcase, is_yelled, contains_a)).to eq({1=>["WHO", "what", "when!", "WHERE!", "WHY"], 2=>[], 3=>[], 4=>[]})
  end
end

describe "procipher" do
  let(:is_yelled) { Proc.new { |s| s[-1] == '!' } } 
  let(:is_upcase) { Proc.new { |s| s.upcase == s } }
  let(:contains_a) { Proc.new { |s| s.downcase.include?('a') } }
  let(:make_question) { Proc.new { |s| s + '???' } }
  let(:reverse) { Proc.new { |s| s.reverse } }
  let(:add_smile) { Proc.new { |s| s + ':)' } }

  it "returns a new sentence where each word of the input sentence is changed by a value proc if the original word returns true when passed into the key proc" do
    expect(procipher('he said what!',
        is_yelled => make_question,
        contains_a => reverse
    )).to eq("he dias ???!tahw")

    expect(procipher('he said what!',
        contains_a => reverse,
        is_yelled => make_question
    )).to eq("he dias !tahw???")

    expect(procipher('he said what!',
        contains_a => reverse,
        is_yelled => add_smile
    )).to eq("he dias !tahw:)")

    expect(procipher('stop that taxi now',
        is_upcase => add_smile,
        is_yelled => reverse,
        contains_a => make_question
    )).to eq("stop that??? taxi??? now")

    expect(procipher('STOP that taxi now!',
        is_upcase => add_smile,
        is_yelled => reverse,
        contains_a => make_question
    )).to eq("STOP:) that??? taxi??? !won")
  end
end

describe "picky_procipher" do
  let(:is_yelled) { Proc.new { |s| s[-1] == '!' } }
  let(:is_upcase) { Proc.new { |s| s.upcase == s } }
  let(:contains_a) { Proc.new { |s| s.downcase.include?('a') } }
  let(:make_question) { Proc.new { |s| s + '???' } }
  let(:reverse) { Proc.new { |s| s.reverse } }
  let(:add_smile) { Proc.new { |s| s + ':)' } } 

  it "return a new sentence where each word of the input sentence is changed by a value proc if the original word returns true when passed into the key proc (if an original word returns true for multiple key procs, then only the value proc that appears earliest in the hash should be applied)" do
    expect(picky_procipher('he said what!',
      is_yelled => make_question,
      contains_a => reverse
    )).to eq("he dias what!???")

    expect(picky_procipher('he said what!',
      contains_a => reverse,
      is_yelled => make_question
    )).to eq("he dias !tahw")

    expect(picky_procipher('he said what!',
      contains_a => reverse,
      is_yelled => add_smile
    )).to eq("he dias !tahw")

    expect(picky_procipher('stop that taxi now',
      is_upcase => add_smile,
      is_yelled => reverse,
      contains_a => make_question
    )).to eq("stop that??? taxi??? now")

    expect(picky_procipher('STOP that taxi!',
      is_upcase => add_smile,
      is_yelled => reverse,
      contains_a => make_question
    )).to eq("STOP:) that??? !ixat")
  end
end
