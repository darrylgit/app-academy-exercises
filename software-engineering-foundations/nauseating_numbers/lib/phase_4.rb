def mersenne_prime(n)
  output = 2
  
  while n > 0
    candidate = output + 1

    until is_mersenne?(candidate)
      candidate += 1
    end

    output = candidate

    n -= 1
  end

  output
end

def is_prime?(num) 
  num >= 2 && (2...num).none? { |factor| num % factor == 0 }
end

def is_mersenne?(num)
  # Check if prime
  return false if !is_prime?(num)

  # Check if num is one less than a power of two
  e = 2
  until 2**e > num
    e += 1
  end

  2**e - 1 == num
end

def triangular_word?(str)
  nums = []
  str.each_char { |char| nums << number_encode(char) }
  
  is_triangular?(nums.sum)
end

def is_triangular?(num)
  (0..num).any? { |i| (i**2 + i) == num * 2 }
end

def number_encode(str)
  "abcdefghijklmnopqrstuvwxyz".index(str) + 1
end