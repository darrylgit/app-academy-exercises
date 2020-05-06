def even_nums(max)
  output = [0]
  i = 1
  while i < max
    if i % 2 == 0
      output << i
    end
    i += 1
  end
  return output
end

print even_nums(10) # => [0, 2, 4, 6, 8, 10]
puts
print even_nums(5)  # => [0, 2, 4]