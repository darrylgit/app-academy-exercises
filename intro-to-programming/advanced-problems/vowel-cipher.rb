def vowel_cipher(string)
  vowels = "aeiou"

  string.each_char.with_index do |char, i|
    if vowels.include?(char)
      string[i] = vowels[(vowels.index(char) + 1) % 5]
    end
  end

  return string

end

puts vowel_cipher("bootcamp") #=> buutcemp
puts vowel_cipher("paper cup") #=> pepir cap