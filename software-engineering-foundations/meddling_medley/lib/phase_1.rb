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