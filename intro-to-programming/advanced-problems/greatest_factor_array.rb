def greatest_factor_array(arr)
  return arr.map { |num| get_factor(num) } 
end

def get_factor(num) 
  if num % 2 == 0
    return (2...num).to_a.select{ |factor| num % factor == 0 }[-1] 
  else
    return num
  end
end

print greatest_factor_array([16, 7, 9, 14]) # => [8, 7, 9, 7]
puts
print greatest_factor_array([30, 3, 24, 21, 10]) # => [15, 3, 12, 21, 5]
puts