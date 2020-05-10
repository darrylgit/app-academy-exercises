def anagrams?(word1, word2)
  
  if word1.length != word2.length
    return false
  end

  word1.each_char do |char|
    if !word2.include?(char)
      return false
    end
  end

  return true
end

puts anagrams?("cat", "act")          #=> true
puts anagrams?("restful", "fluster")  #=> true
puts anagrams?("cat", "dog")          #=> false
puts anagrams?("boot", "bootcamp")    #=> false