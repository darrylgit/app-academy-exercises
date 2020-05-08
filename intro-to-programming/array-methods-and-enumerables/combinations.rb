def combinations(arr)
  outputArr = []
  arr.each_with_index do |el1, index1|
    arr.each_with_index do |el2, index2|
      if index1 < index2
        outputArr << [el1, el2]
      end
    end
  end

  return outputArr
end

print combinations(["a", "b", "c"]); # => [ [ "a", "b" ], [ "a", "c" ], [ "b", "c" ] ]
puts

print combinations([0, 1, 2, 3]); # => [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 1, 2 ], [ 1, 3 ], [ 2, 3 ] ]
puts