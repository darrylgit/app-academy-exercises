# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
  return num if prime?(num)

  prime_factors(num).max
end

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

def prime?(num)
  return false if num < 2

  (2...num).each do |factor|
      if num % factor == 0
          return false
      end
  end

  true
end

def unique_chars?(str)
  tallies = Hash.new(0)

  str.each_char { |char| tallies[char] += 1}

  tallies.each_value { |val| return false if val > 1 }
  
  true
end

def dupe_indices(arr)
  output = {}
  arr.each_with_index do |el, i|
    if arr.count(el) > 1
      output.has_key?(el) ? output[el] << i : output[el] = [i]
    end
  end 

  output
end

def ana_array(arr1, arr2)
  return false if arr1.length != arr2.length

  arr1.each do |el|
    return false if arr1.count(el) != arr2.count(el)
  end

  true
end