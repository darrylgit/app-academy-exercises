def yell(words)
  i = 0
  while i < words.length
    words[i] += "!"
    i += 1
  end
  return words
end

print yell(["hello", "world"]) # => ["hello!", "world!"]
puts
print yell(["code", "is", "cool"]) # => ["code!", "is!", "cool!"]