# Pig latin translation uses the following rules:
# - for words that start with a vowel, add 'yay' to the end
# - for words that start with a nonvowel, move all letters before the first vowel to the end of the word and add 'ay'

def pig_latin_word(word)
  vowels = "aeiou"

  if vowels.include?(word[0])
    word += "yay"
  else
    lettersArray = word.split('')
    while !vowels.include?(lettersArray[0])
      lettersArray.push(lettersArray.shift)
    end

    word = lettersArray.join('')
    word += "ay"
  end

  return word

end

puts pig_latin_word("apple")   # => "appleyay"
puts pig_latin_word("eat")     # => "eatyay"
puts pig_latin_word("banana")  # => "ananabay"
puts pig_latin_word("trash")   # => "ashtray"