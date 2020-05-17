def all_words_capitalized?(arr)
 # lol I forgot String.capitalize was a thing
  arr.all? { |word| word[0] == word[0].upcase && word[1..-1] == word[1..-1].downcase }
end

def no_valid_url?(arr)
  arr.none? { |url| ["com", "net", "io", "org"].include?(url.split(".")[1]) }
end

def any_passing_students?(arr)
  arr.any? { |student| student[:grades].sum / student[:grades].length >= 75 }
end

