def pick_primes(numbers)
  return numbers.select { |number| prime?(number) }
end

# ZOMFG it's the algorithm from the other exercise
def prime?(num)
  if num < 2
    return false
  end
  
  divisors = (1..num/2).to_a.select{|divisor| divisor != 1 && num % divisor == 0 }

  return !(divisors.length > 0)
end

print pick_primes([2, 3, 4, 5, 6]) #=> [2, 3, 5]
puts
print pick_primes([101, 20, 103, 2017]) #=> [101, 103, 2017]
puts