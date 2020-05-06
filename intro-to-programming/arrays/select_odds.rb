def select_odds(numbers)
  output = []
  i = 0

  while i < numbers.length
    if (numbers[i] % 2 != 0)
      output << numbers[i]
    end
    i += 1
  end

  return output
end

print select_odds([13, 4, 3, 7, 6, 11]) # => [13, 3, 7, 11]
puts
print select_odds([2, 4, 6])            # => []