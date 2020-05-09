def ae_count(str)
  output = {
    "a" => 0,
    "e" => 0
  }

  str.each_char do |char|
    if char == "a" || char == "e"
      output[char] += 1
    end
  end

  return output
end

puts ae_count("everyone can program") #=> {"a"=>2, "e"=>3}
puts ae_count("keyboard") #=> {"a"=>1, "e"=>1}