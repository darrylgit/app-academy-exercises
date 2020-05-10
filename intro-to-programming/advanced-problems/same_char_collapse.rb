def same_char_collapse(str)

  while check_for_pairs(str)
    index = check_for_pairs(str)
    2.times { str[index] = "" }
  end

  return str
end

def check_for_pairs(str)
  str.each_char.with_index do |char, i|
    if char == str[i+1] && i < str.length
      return i 
    end
  end

  return false
end

puts same_char_collapse("zzzxaaxy")   #=> "zy"
# because zzzxaaxy -> zxaaxy -> zxxy -> zy


puts same_char_collapse("uqrssrqvtt") #=> "uv"
# because uqrssrqvtt -> uqrrqvtt -> uqqvtt -> uvtt -> uv