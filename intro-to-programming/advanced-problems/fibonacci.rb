def fibonacci(length)
  output = []

  while output.length < length
    if output.length < 2
      output << 1
    else 
      output << output[-2] + output[-1]
    end
  end

  return output

end

print fibonacci(0) # => []
puts
print fibonacci(1) # => [1]
puts
print fibonacci(6) # => [1, 1, 2, 3, 5, 8]
puts
print fibonacci(8) # => [1, 1, 2, 3, 5, 8, 13, 21]
puts