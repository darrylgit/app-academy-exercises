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


