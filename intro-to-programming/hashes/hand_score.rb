def hand_score(hand)
  output = 0
  
  scores = {
    "a" => 4,
    "k" => 3,
    "q" => 2,
    "j" => 1
  }

  hand.downcase.each_char { |char| output += scores[char] }

  return output
  
end

puts hand_score("AQAJ") #=> 11
puts hand_score("jJka") #=> 9