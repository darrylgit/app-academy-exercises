def duos(str)
  letters = str.split('')

  count = 0

  (0...letters.length - 1).each do |idx|
    count += 1 if letters[idx] == letters[idx + 1]
  end

  count 
end

def sentence_swap(str, hash)
  words = str.split(" ")
  
  words.each_with_index do |word, i|
    words[i] = hash[word] || word
  end

  words.join(" ")
end

def hash_mapped(hash, prc, &block)
  new_hash = { }

  hash.each { |key, value| new_hash[block.call(key)] = prc.call(value) }
  
  new_hash
end

def counted_characters(str)
  tallies = Hash.new(0)

  str.each_char { |char| tallies[char] += 1}

  tallies.select { |k, v| v > 2 }.keys
end

def triplet_true?(str)
  letters = str.split('')

  letters.inject(['']) do |acc, val| 
    if val == acc[-1][-1]
      acc[-1] += val
    else
      acc << val
    end

    acc
  end.map { |val| val.length }.max >= 3
end

def energetic_encoding(str, hash)
  (0...str.length).each do |idx|
    str[idx] = hash[str[idx]] || '?' if str[idx] != ' '
  end

  str
end

def uncompress(str)
  output = ""

  chars = []
  nums = []

  str.split('').each_with_index { |char, i| i % 2 == 0 ? chars << char : nums << char.to_i }

  (0...chars.length).each do |idx|
    nums[idx].times { output += chars[idx] }
  end

  output 
end