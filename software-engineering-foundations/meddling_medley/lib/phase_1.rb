def duos(str)
  letters = str.split('')

  count = 0

  (0...letters.length - 1).each do |idx|
    count += 1 if letters[idx] == letters[idx + 1]
  end

  count 
end