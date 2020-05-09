def frequent_letters(string)
  tallies = Hash.new(0)

  string.each_char { |char| tallies[char] += 1 }

  output = []
  tallies.each_key do |key|
    if tallies[key] > 2
      output << key
    end
  end
  
  return output
end

print frequent_letters('mississippi') #=> ["i", "s"]
puts
print frequent_letters('bootcamp') #=> []
puts