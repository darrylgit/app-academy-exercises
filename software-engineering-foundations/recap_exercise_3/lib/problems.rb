require "byebug"

def no_dupes?(arr)
  output = [*arr]

  (0...arr.length).each do |idx1|
    (idx1 + 1...arr.length).each do |idx2|
      output.select! { |el| el != arr[idx1] } if arr[idx1] == arr[idx2]
    end
  end

  output
end

def no_consecutive_repeats?(arr)
  (0...arr.length - 1).each do |idx|
    return false if arr[idx] == arr[idx + 1]
  end
  
  true
end

def char_indices(str)
  tallies = Hash.new([])

  str.each_char.with_index { |char, i| tallies[char].length > 0 ? tallies[char] << i : tallies[char] = [i] }

  tallies
end

def longest_streak(str)
  output = str.split('').inject({ streak:"", current:"" }) do |acc, char|
    
    acc[:current].include?(char) ? acc[:current] += char : acc[:current] = char
  

    if acc[:streak].include?(char)
      acc[:streak] += char
    elsif acc[:current].length >= acc[:streak].length
      acc[:streak] = acc[:current]
    end
    
    acc
  end

  output[:streak]

end

def bi_prime?(num)
  # Check if prime factors array has exactly two elements
  return prime_factors(num).length == 2
end

def prime_factors(num)
  # Generate primes between 2 and num 
  primes = (2...num).to_a.select { |factor| prime?(factor) }

  factors = []

  while num > 1
    candidate = primes.shift

    # If candidate is a factor, divide num by candidate as many times as possbile and keep shovelling candidate into factors array
    while num % candidate == 0
      num /= candidate
      factors << candidate
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

def vigenere_cipher(str, keys)
  alphabet = "abcdefghijklmnopqrstuvwxyz"

  str.each_char.with_index do |letter, i|
    # Figure out the vigenere key for this iteration
    vigenere_key = keys[i % keys.length];

    #Rotate letter by that key value
    str[i] = alphabet[(alphabet.index(letter) + vigenere_key) % 26]
  end

  str
end

def vowel_rotate(str) 
  vowels = "aeiou"

  # Extract vowels from string
  str_vowels = str.split('').select { |char| vowels.include?(char) }

  # Re-order that array
  str_vowels.unshift(str_vowels.pop)

  # Replace vowels in string with vowels from that array
  str.each_char.with_index do |char, i|
    if vowels.include?(char)
      str[i] = str_vowels.shift
    end
  end
  
  str
end
