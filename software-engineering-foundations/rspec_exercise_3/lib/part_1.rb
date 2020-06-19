def is_prime?(num) 
  num >= 2 && (2...num).none? { |factor| num % factor == 0 }
end

def nth_prime(num)
  output = 2

  while num > 1
    num -= 1

    candidate = output + 1

    while (!is_prime?(candidate))
      candidate += 1
    end

    output = candidate

  end

  output
end

def prime_range(min, max)
  (min..max).select { |el| is_prime?(el) }
end