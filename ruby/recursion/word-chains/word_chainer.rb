require 'byebug'

class WordChainer 

  attr_reader :all_seen_words
  def initialize(dictionary_file_name = "dictionary.txt")
     # Load words into dictionary set
     @dictionary = Set.new([])

     file = File.open(dictionary_file_name, "r")
 
     file.each_line do |line|
       @dictionary.add(line.chomp)
     end
 
     file.close

     @current_words = []
     @all_seen_words = []
  end

  def adjacent_words(word)
    return nil if !@dictionary.include?(word)

    @dictionary.select { |dict_word| self.word_compare(dict_word, word) }
  end

  def word_compare(original_word, candidate_word)
    # Reject immediately if length is different or if words are exactly equal
    return false if original_word.length != candidate_word.length || original_word == candidate_word

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

  def run(source, target = nil)
    @current_words << source
    @all_seen_words << source

    while !@current_words.empty?
      new_current_words = []

      @current_words.each do |word|
        self.adjacent_words(word).each do |adj_word|
          next if @all_seen_words.include?(adj_word)
          
          new_current_words << adj_word
          @all_seen_words << adj_word
        end
        
        @current_words = new_current_words
      end
      print new_current_words

    end

  end
end