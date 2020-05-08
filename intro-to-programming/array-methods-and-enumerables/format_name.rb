# Hint: use str.upcase and str.downcase
# "abc".upcase # => "ABC"

def format_name(str)
  wordsArray = str.split(' ')
  wordsArray.each_with_index do |word, wordIndex|
    formattedWord = ''
    formattedWord += word[0].upcase
    formattedWord += word[1..-1].downcase
    wordsArray[wordIndex] = formattedWord
  end
  return wordsArray.join(' ')
end

puts format_name("chase WILSON") # => "Chase Wilson"
puts format_name("brian CrAwFoRd scoTT") # => "Brian Crawford Scott"