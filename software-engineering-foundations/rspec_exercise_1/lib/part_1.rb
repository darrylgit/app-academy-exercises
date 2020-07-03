def average(num1, num2)
  (num1 + num2) / 2.0
end

def average_array(arr)
  arr.sum / ( arr.length * 1.0 )
end

puts average_array([1, 2, 3])

def repeat(str, num)
  str * num
end

def yell(str)
  str.upcase + "!"
end

def alternating_case(str)
  str.split.map.with_index { |word, i| i.even? ? word.upcase  : word.downcase }.join(' ')
end