# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
  groups = []

  str.each_char do |char|
    if groups.length == 0
      groups << [char]
    elsif groups.last[0] == char
      groups.last << char
    else
      groups << [char]
    end
  end

  groups.map do |el|
    if el.length == 1
      el[0]
    else
      el.length.to_s + el[0]
    end
  end.join
end


p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
