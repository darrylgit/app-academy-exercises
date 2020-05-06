def reverse(word)
  output = ""
  i = word.length
  while i > 0
    i -= 1
    output += word[i]
  end
  return output
end

puts reverse("cat")          # => "tac"
puts reverse("programming")  # => "gnimmargorp"
puts reverse("bootcamp")     # => "pmactoob"