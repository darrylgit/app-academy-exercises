def most_vowels(sentence)
  vowelly = { "word" => "", "vowelCount" => 0}
  sentence.split(' ').each do |word|
    currentVowelCount = vowel_counter(word)

    if currentVowelCount > vowelly["vowelCount"]
      vowelly["word"] = word
      vowelly["vowelCount"] = currentVowelCount
    end
  end

  return vowelly["word"]

end

def vowel_counter(str)
  vowels = "aeiou"
  counter = 0
  str.split('').each do |char| 
    if vowels.include?(char)
      counter += 1
    end
  end
  return counter
end

print most_vowels("what a wonderful life") #=> "wonderful"