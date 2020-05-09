def last_index(str, char)
  #WARNING: Shmancy one-liner
  return str.split('').map.with_index { |char, i| { "char" => char, "i" => i}}.select { |hash| hash["char"] == char }[-1]["i"]
end

puts last_index("abca", "a")       #=> 3
puts last_index("mississipi", "i") #=> 9
puts last_index("octagon", "o")    #=> 5
puts last_index("programming", "m")#=> 7