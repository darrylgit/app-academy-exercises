def to_initials(name)
  initials = ""
  initialsArray = name.split(" ").each { |word| initials += word[0]}
  return initials
end

puts to_initials("Kelvin Bridges")      # => "KB"
puts to_initials("Michaela Yamamoto")   # => "MY"
puts to_initials("Mary La Grange")      # => "MLG"