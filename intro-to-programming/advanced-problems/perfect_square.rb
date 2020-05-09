def perfect_square?(num)
  (2...num).each do |factor| 
    
    if (num * 1.0 / factor ) == factor * 1.0
      return true
    end
  end

  return false
end

puts perfect_square?(5)   #=> false
puts perfect_square?(12)  #=> false
puts perfect_square?(30)  #=> false
puts perfect_square?(9)   #=> true
puts perfect_square?(25)  #=> true