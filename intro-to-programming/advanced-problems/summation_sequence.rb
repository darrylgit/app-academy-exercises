def summation_sequence(start, length)
  output = [start]
  i = 1

  while i < length  
    output << summer(output[i - 1])
    i += 1
  end

  return output
end

def summer(num)
  sum = 0
  (1..num).each { |val| sum += val }

  return sum
end


print summation_sequence(3, 4) # => [3, 6, 21, 231]
print summation_sequence(5, 3) # => [5, 15, 120]