def larger_number(num1, num2)
  if num1 > num2
    return num1
  end
  return num2
end

puts larger_number(42, 28)   # => 42
puts larger_number(99, 100)  # => 100