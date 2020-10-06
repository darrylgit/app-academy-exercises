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
     @all_seen_words = { }
     @previous_source = nil
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
    # Reset if new source
    if @previous_source != source
      @previous_source = source
      @current_words = [source]
      @all_seen_words = { source => nil }
  
      while !@current_words.empty?
        self.explore_current_words
      end
    end


    self.build_path(target)
  end

  def explore_current_words
    new_current_words = []

    @current_words.each do |current_word|
      self.adjacent_words(current_word).each do |adjacent_word|
        next if @all_seen_words.has_key?(adjacent_word)
        
        new_current_words << adjacent_word
        @all_seen_words[adjacent_word] = current_word
      end
      
      @current_words = new_current_words
    end

    new_current_words.each do |current_word|
      puts "#{current_word} => #{all_seen_words[current_word]}"
    end
  end

  def build_path(target)
    path = [target]

    while @all_seen_words[path[0]]
      path.unshift(@all_seen_words[path[0]])
    end

    path
  end
end