def fizz_buzz(max)
  output = []
  i = 4

  while i < max
    if i % 4 == 0 && i % 6 == 0
      i += 2
      next
    elsif i % 4 == 0
      output << i
    elsif i % 6 == 0
      output << i
    end
    i += 2
  end
    
  return output
end

print fizz_buzz(20) # => [4, 6, 8, 16, 18]
puts
print fizz_buzz(15) # => [4, 6, 8]