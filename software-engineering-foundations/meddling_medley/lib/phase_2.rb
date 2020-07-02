def conjunct_select(arr, *prcs)
  prcs.each { |prc| arr = arr.select { |el| prc.call(el) } }
  arr
end

def convert_pig_latin(str)
  words = str.split(' ')

  words.each_with_index do |word, i|
    if word.length >= 3
      if 'aeiou'.include?(word[0].downcase)
        words[i] = word + 'yay'
      else
        capitalized = word[0] == word[0].upcase
        first_vowel = word.index(/[aeiou]/)

        new_word = word[first_vowel..-1] + word[0...first_vowel] + "ay"

        words[i] = capitalized ? new_word[0].upcase + new_word[1..-1].downcase : new_word
      end
    end
  end

  words.join(' ')
end

def reverberate(str)
  words = str.split(' ')

  words.each_with_index do |word, i|
    if word.length >= 3
      if 'aeiou'.include?(word[-1])
        words[i] = word + word.downcase
      else
        last_vowel = word.rindex(/[aeiou]/)

        words[i] = word + word[last_vowel..-1]
      end
    end
  end

  words.join(' ')
end

def disjunct_select(arr, *prcs)
  arr.select { |el| prcs.map { |prc| prc.call(el) }.any? }
end

def alternating_vowel(str)
  words = str.split(' ')

  words.each_with_index do |word, i|
    vowel_idx = i % 2 == 0 ? word.index(/[aeiou]/) : word.rindex(/[aeiou]/)

    vowel_idx && words[i] = word[0...vowel_idx] + word[vowel_idx + 1..-1]
  end

  words.join(' ')
end

def silly_talk(str)
  words = str.split(' ')

  words.each_with_index do |word, i|
    if "aeiou".include?(word[-1])
      words[i] = word + word[-1]
    else
      capitalized = word[0] == word[0].upcase
      words[i] = word.split('').map { |char| "aeiouAEIOU".include?(char.downcase) ? char + "b" + char.downcase : char }.join('')
    end
  end

  words.join(' ')
end