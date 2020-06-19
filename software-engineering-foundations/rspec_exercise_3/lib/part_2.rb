def element_count(arr)
  counts = Hash.new(0)
  arr.each { |el| counts[el] += 1 }
  counts
end