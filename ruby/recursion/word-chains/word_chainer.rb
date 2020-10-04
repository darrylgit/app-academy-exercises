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
end