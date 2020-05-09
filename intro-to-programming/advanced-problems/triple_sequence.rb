def triple_sequence(start, length)
  output = []
  length.times { output << start }
  return output.map.with_index do |num, i|
    num * 3**i
  end
end


print triple_sequence(2, 4) # => [2, 6, 18, 54]
puts
print triple_sequence(4, 5) # => [4, 12, 36, 108, 324]
puts