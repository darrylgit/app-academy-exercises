def abbreviate_sentence(sent)
  wordArray = sent.split(' ')
  wordArray.each_with_index do |word, wordIndex|
    if (word.length > 4) 
      vowels = ['a', 'e', 'i', 'o', 'u']
      letterArray = word.split('')
      letterArray.each_with_index do |letter, letterIndex|
        if (vowels.include?(letter)) 
          letterArray[letterIndex] = ""
        end
      end
    
      wordArray[wordIndex] = letterArray.join('')
    end
  end

  return wordArray.join(' ')
end

puts abbreviate_sentence("follow the yellow brick road") # => "fllw the yllw brck road"
puts abbreviate_sentence("what a wonderful life")        # => "what a wndrfl life"