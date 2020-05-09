def prime?(num)
  if num < 2
    return false
  end
  
  divisors = (1..num/2).to_a.select{|divisor| divisor != 1 && num % divisor == 0 }

  return !(divisors.length > 0)
end

puts prime?(2)  #=> true
puts prime?(5)  #=> true
puts prime?(11) #=> true
puts prime?(4)  #=> false
puts prime?(9)  #=> false
puts prime?(-5) #=> false