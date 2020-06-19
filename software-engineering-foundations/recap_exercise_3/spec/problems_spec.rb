require "problems"

describe "no dupes" do
  it "should remove duplicate numbers" do
    expect(no_dupes?([1, 1, 2, 1, 3, 2, 4]) ).to eq([3, 4])
  end

  it "should remove duplicate strings" do
    expect(no_dupes?(['x', 'x', 'y', 'z', 'z'])).to eq(['y'])
  end

  it "should remove duplicate booleans" do
    expect(no_dupes?([true, true, true])).to eq([])
  end
end

describe "no consecutive repeats" do
  it "should return true if there no repeats" do
    expect(no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])).to eq(true)
    expect(no_consecutive_repeats?([10, 42, 3, 7, 10, 3])).to eq(true)
    expect(no_consecutive_repeats?(['x'])).to eq(true)
  end

  it "should return false if there are repeats" do
    expect(no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])).to eq(false)
    expect(no_consecutive_repeats?([10, 42, 3, 3, 10, 3])).to eq(false)
  end
end

describe "char indices" do
  it "should return a hash of indices with characters as keys" do
    expect(char_indices('mississippi')).to eq({"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]})
    expect(char_indices('classroom')).to eq({"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]})
  end
end

describe "longest streak" do
  it "should return the longest streak in the given string" do
    expect(longest_streak('a')).to eq('a')
    expect(longest_streak('accccbbb')).to eq('cccc')
    expect(longest_streak('aaaxyyyyyzz')).to eq('yyyyy')
  end

  it "should return the latter streak in the event of a tie" do
    expect(longest_streak('aaabbb')).to eq('bbb')
    expect(longest_streak('abc')).to eq('c')
  end
end

describe "bi prime" do
  it "should return true for bi-prime numbers" do
    expect(bi_prime?(14)).to eq(true)
    expect(bi_prime?(22)).to eq(true)
    expect(bi_prime?(25)).to eq(true)
  end

  it "should return false for non-bi-prime numbers" do
    expect(bi_prime?(24)).to eq(false)
    expect(bi_prime?(40)).to eq(false)
    expect(bi_prime?(100)).to eq(false)
  end
end

describe "vigenere" do
  it "should do the vigenere thing" do
    expect(vigenere_cipher("toerrishuman", [1])).to eq("upfssjtivnbo")
    expect(vigenere_cipher("toerrishuman", [1, 2])).to eq("uqftsktjvobp")
    expect(vigenere_cipher("toerrishuman", [1, 2, 3])).to eq("uqhstltjxncq")
    expect(vigenere_cipher("zebra", [3, 0])).to eq("ceerd")
    expect(vigenere_cipher("yawn", [5, 1])).to eq("dbbo")
  end
end

describe "vowel rotate" do
  it "should rotate vowels like a boss" do
    expect(vowel_rotate('computer')).to eq("cempotur")
    expect(vowel_rotate('oranges')).to eq("erongas")
    expect(vowel_rotate('headphones')).to eq("heedphanos")
    expect(vowel_rotate('bootcamp')).to eq("baotcomp")
    expect(vowel_rotate('awesome')).to eq("ewasemo")
  end
end

describe "String#select" do
  it "should select things from Strings" do
    expect("app academy".select { |ch| !"aeiou".include?(ch) }).to eq("pp cdmy")   
    expect("HELLOworld".select { |ch| ch == ch.upcase }).to eq("HELLO")         
    expect("HELLOworld".select).to eq("")         
  end
end

describe "String#map!" do
  it "should map Strings" do 
    word_1 = "Lovelace"
    word_1.map! do |ch| 
      if ch == 'e'
          '3'
      elsif ch == 'a'
          '4'
      else
          ch
      end
    end
    expect(word_1).to eq("Lov3l4c3")

    word_2 = "Dijkstra"
    word_2.map! do |ch, i|
      if i.even?
        ch.upcase
      else
        ch.downcase
      end
    end
    expect(word_2).to eq("DiJkStRa")
  end
end

describe("multiply") do
  it "should multiply things (recursively)" do
    expect(multiply(3, 5)).to eq(15)     
    expect(multiply(5, 3)).to eq(15)     
    expect(multiply(2, 4)).to eq(8)    
    expect(multiply(0, 10)).to eq(0)    
    expect(multiply(-3, -6)).to eq(18)     
    expect(multiply(3, -6)).to eq(-18)      
    expect(multiply(-3, 6)).to eq(-18)  
  end
end  

describe("lucas sequence") do
  it "should make Lucas sequences" do
    expect(lucas_sequence(0)).to eq([])
    expect(lucas_sequence(1)).to eq([2])   
    expect(lucas_sequence(2)).to eq([2, 1])   
    expect(lucas_sequence(3)).to eq([2, 1, 3])   
    expect(lucas_sequence(6)).to eq([2, 1, 3, 4, 7, 11])   
    expect(lucas_sequence(8)).to eq([2, 1, 3, 4, 7, 11, 18, 29])
  end
end