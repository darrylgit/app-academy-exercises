def element_count(arr)
  counts = Hash.new(0)
  arr.each { |el| counts[el] += 1 }
  counts
end

def char_replace!(str, hash)
  str.each_char.with_index { |char, i| hash.has_key?(char) ? str[i] = hash[char] : nil }
end