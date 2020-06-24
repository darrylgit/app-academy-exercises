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

def consecutive_collapse(arr)
  # Keep paring down the original array using splats
  while adjacent_index(arr)
    i = adjacent_index(arr)
    arr = [*arr[0...i], *arr[i + 2..-1]]
  end

  arr
end

def adjacent_index(arr)
  # Return index of first element in consecutive adjacent pair
  (0...arr.length - 1).each do |idx|
    return idx if (arr[idx] - arr[idx+1]).abs == 1
  end

  nil
end

def pretentious_primes(arr, n)
  arr.map do |el|
    # Copy n
    x = n 

    # When n is positive:
    if n > 0

      while x > 0
        # Increment el (in case el is already prime)
        el = el + 1

        # Find next prime
        until is_prime?(el)
          el += 1
        end

        x -= 1
      end
    else
      # When n is negative:
      while x < 0
        # Skip iteration if we've already reached nil
        next if el == nil
        
        # Decrement el (in case el is already prime)
        el = el - 1

        until is_prime?(el) || el == 0
          el -= 1
        end

        # Make el nil if we reached 0
        if el == 0
          el = nil
          break
        end

        x += 1
      end

    end

    el
  end
end

