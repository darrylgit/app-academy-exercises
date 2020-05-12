# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num1, num2)
  factors1 = prime_factors(num1)
  factors2 = prime_factors(num2)

  factors1.each do |factor|
    if factors2.include?(factor)
      return false
    end
  end

  true

end

#  Reusing algorithms like a boss
def prime_factors(num)

  if prime?(num)
    return [num]
  end

  primes = (2...num).to_a.select { |factor| prime?(factor) }

  
  
  factors = []

  while num > 1
    candidate = primes.shift

    if num % candidate == 0
      factors << candidate
      while num % candidate == 0
        num /= candidate
      end
    end
  end

  return factors
  
end

def prime?(num)
  if num < 2
    return false
  end
  
  divisors = (1..num/2).to_a.select{|divisor| divisor != 1 && num % divisor == 0 }

  return !(divisors.length > 0)
end


p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
