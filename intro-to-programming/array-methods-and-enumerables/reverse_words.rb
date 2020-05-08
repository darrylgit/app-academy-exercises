def reverse_words(sent)
  wordsArray = sent.split(' ')
  wordsArray.each_with_index do |word, index|
    lettersArray = word.split('')
    reversedWord = ""
    lettersArray.length.times { reversedWord += lettersArray.pop }
    wordsArray[index] = reversedWord
  end

  return wordsArray.join(' ')
end

puts reverse_words('keep coding') # => 'peek gnidoc'
puts reverse_words('simplicity is prerequisite for reliability') # => 'yticilpmis si etisiuqererp rof ytilibailer'