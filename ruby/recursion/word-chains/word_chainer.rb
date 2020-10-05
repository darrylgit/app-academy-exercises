require 'byebug'

class WordChainer 
  def initialize(dictionary_file_name = "dictionary.txt")
     # Load words into dictionary set
     @dictionary = Set.new([])

     file = File.open(dictionary_file_name, "r")
 
     file.each_line do |line|
       @dictionary.add(line.chomp)
     end
 
     file.close
  end

  def adjacent_words(word)
    return nil if !@dictionary.include?(word)

    @dictionary.select { |dict_word| self.word_compare(dict_word, word) }
  end

  def word_compare(original_word, candidate_word)
    # Reject immediately if length is different 
    return false if original_word.length != candidate_word.length

    candidate_word_dup = candidate_word.dup
    original_word_dup = original_word.dup

    (0...original_word.length).each do |i|
      # Change one letter
      candidate_word_dup[i] = "%"
      original_word_dup[i] = "%"
    
      # Compare 
      return true if original_word_dup == candidate_word_dup

      # Reset 
      candidate_word_dup[i] = candidate_word[i]
      original_word_dup[i] = original_word[i]
    end 

    false
  end
end