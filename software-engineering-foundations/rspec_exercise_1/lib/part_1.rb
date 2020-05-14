def average(num1, num2)
  return (num1 + num2) / 2.0
end

def average_array(arr)
  return arr.sum / ( arr.length * 1.0 )
end

puts average_array([1, 2, 3])
