def prime_factors(num)
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

# ZOMFG it's the algorithm from the other exercise, but like, again
def prime?(num)
  if num < 2
    return false
  end
  
  divisors = (1..num/2).to_a.select{|divisor| divisor != 1 && num % divisor == 0 }

  return !(divisors.length > 0)
end

print prime_factors(24) #=> [2, 3]
puts
print prime_factors(60) #=> [2, 3, 5]
puts