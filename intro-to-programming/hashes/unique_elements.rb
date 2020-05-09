# Hint: all keys of a hash are automatically unique

def unique_elements(arr)
  tallies = { }

  arr.each { |el| tallies[el] = "lmao" }
  
  output = []
  tallies.each_key { |k| output << k}

  return output

  # Note to self: use .keys() next time
end

print unique_elements(['a', 'b', 'a', 'a', 'b', 'c']) #=> ["a", "b", "c"]
puts