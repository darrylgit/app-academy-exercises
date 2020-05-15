def hipsterfy(str)

  str.reverse.each_char.with_index do |char, i|
    if "aeiou".include?(char)
      str.reverse![i] = ''
      return str.reverse
    end
  end

  str
end

def vowel_counts(str)
  output = Hash.new(0)

  str.each_char { |char| output[char.downcase] += 1 if "aeiou".include?(char.downcase) }

  output
end

def caesar_cipher(str, num)
  alphabet = "abcdefghijklmnopqrstuvwxyz"

  str.each_char.with_index { |letter, i| str[i] = alphabet[(alphabet.index(letter) + num) % 26] if alphabet.include?(letter) }
end