def first_half(array)
  output = []
  i = 0

  # Hush, it works
  while i + 0.5 < array.length / 2.0 + 0.5
    output << array[i]
    i += 1
  end

  return output

end

print first_half(["Brian", "Abby", "David", "Ommi"]) # => ["Brian", "Abby"]
puts
print first_half(["a", "b", "c", "d", "e"])          # => ["a", "b", "c"]