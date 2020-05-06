def is_palindrome(word)
  reverse = ""
  i = word.length
  while i > 0
    i -= 1
    reverse += word[i]
  end
  return reverse == word
end

puts is_palindrome("racecar")  # => true
puts is_palindrome("kayak")    # => true
puts is_palindrome("bootcamp") # => false