def opposite_count(nums)
  count = 0

  nums.each_with_index do |el1, index1|
    nums.each_with_index do |el2, index2|
      if index1 < index2 && el1 + el2 == 0
        count += 1
      end
    end
  end

  return count
end

puts opposite_count([ 2, 5, 11, -5, -2, 7 ]) # => 2
puts opposite_count([ 21, -23, 24 -12, 23 ]) # => 1