def count_a(word)
  i = 0
  count = 0
  while i < word.length
    if word[i].downcase == "a" 
      count += 1
    end
    i += 1
  end

  return count
end

puts count_a("application")  # => 2
puts count_a("bike")         # => 0
puts count_a("Arthur")       # => 1
puts count_a("Aardvark")     # => 3