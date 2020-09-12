require('set')

word_bank = Set.new([])

file = File.open("dictionary.txt", "r")

file.each_line do |line|
  word_bank.add(line.chomp)
end

file.close

class Dictionary
  @@word_bank = word_bank
end