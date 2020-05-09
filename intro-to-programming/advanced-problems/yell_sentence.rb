def yell_sentence(sent)
  return sent.split(' ').map {|el| el.upcase + "!"}.join(" ")
end

puts yell_sentence("I have a bad feeling about this") #=> "I! HAVE! A! BAD! FEELING! ABOUT! THIS!"