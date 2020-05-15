def palindrome?(str)
  reverse = ''
  str.split('').reverse_each { |char| reverse += char }

  reverse == str
end

def substrings(str)
  output = []
  start = 0
  while start < str.length
    finish = start
    while finish < str.length
      output << str[start..finish]
      finish += 1
    end
    start += 1
  end

  output
end

def palindrome_substrings(str)
  substrings(str).select { |substr| palindrome?(substr) && substr.length > 1 }
end

