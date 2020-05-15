def partition(arr, num)
  [arr.select { |el| el < num }, arr.select { |el| el >= num}]
end

def merge(*hashes)
  output = { }
  hashes.each { |hash| hash.each { |key, value| output[key] = value } }
  output
end

def censor(sentence, arr)

  sentence.split(" ").each do |word|
    if arr.include?(word.downcase)
      word.each_char.with_index do |char, j| 
        if "aeiou".include?(char.downcase)
          word[j] = "*"
        end
      end
    end
  end.join(' ')

end

def power_of_two?(num)
  while num >= 1
    return true if num == 1.0
    num /= 2.0
  end

  false
end