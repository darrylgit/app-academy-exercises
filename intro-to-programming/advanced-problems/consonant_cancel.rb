def consonant_cancel(sentence)
  vowels = "aeiou"

  return sentence.split(" ").map do |el|
    while !vowels.include?(el[0])
      el = el[1..-1]
    end
    el
  end.join(" ")

end

puts consonant_cancel("down the rabbit hole") #=> "own e abbit ole"
puts consonant_cancel("writing code is challenging") #=> "iting ode is allenging"