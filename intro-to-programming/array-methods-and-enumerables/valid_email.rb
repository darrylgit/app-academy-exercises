# For simplicity, we'll consider an email valid when it satisfies all of the following:
# - contains exactly one @ symbol
# - contains only lowercase alphabetic letters before the @
# - contains exactly one . after the @

def is_valid_email(str)
  if !check_for_one("@", str)
    return false 
  end

  if !check_for_one(".", str.split("@")[1])
    return false
  end
 
  str.split('@')[0].each_char do |char|
    if '01234567890'.include?(char)
      return false
    end
  end

  return true
end

def check_for_one(charToCheck, str)
  counter = 0
  str.each_char do |char|
    if char === charToCheck
      counter += 1
    end
  end

  if counter == 1
    return true
  end
  
  return false
end

puts is_valid_email("abc@xy.z")         # => true
puts is_valid_email("jdoe@gmail.com")   # => true
puts is_valid_email("jdoe@g@mail.com")  # => false
puts is_valid_email("jdoe42@gmail.com") # => false
puts is_valid_email("jdoegmail.com")    # => false
puts is_valid_email("az@email")         # => false