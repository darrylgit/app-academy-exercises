def word_check(word)
  if word.length > 6
    return "long"
  elsif word.length < 6 
    return "short"
  end
  return "medium"
end

puts word_check("contraption") # => "long"
puts word_check("fruit")       # => "short"
puts word_check("puzzle")      # => "medium"