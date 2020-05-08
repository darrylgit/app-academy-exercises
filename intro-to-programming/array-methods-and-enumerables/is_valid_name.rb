# A name is valid is if satisfies all of the following:
# - contains at least a first name and last name, separated by spaces
# - each part of the name should be capitalized
#
# Hint: use str.upcase or str.downcase
# "a".upcase # => "A"

def is_valid_name(str)
  wordArray = str.split(' ')
  if wordArray.length == 1
    return false
  end

  wordArray.each_with_index do |word, wordIndex|
    formattedWord = ''
    formattedWord += word[0].upcase
    formattedWord += word[1..-1].downcase
    wordArray[wordIndex] = formattedWord
  end
  
  if wordArray.join(' ') == str 
    return true
  end

  return false
end

puts is_valid_name("Kush Patel")       # => true
puts is_valid_name("Daniel")           # => false
puts is_valid_name("Robert Downey Jr") # => true
puts is_valid_name("ROBERT DOWNEY JR") # => false