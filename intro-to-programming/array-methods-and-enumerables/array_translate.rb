def array_translate(array)
  output = ""
  array.each_with_index do |el, i|
    if el == el.to_s
      array[i + 1].times do
        output += el
      end
    end
  end
  
  return output
end

print array_translate(["Cat", 2, "Dog", 3, "Mouse", 1]); # => "CatCatDogDogDogMouse"
puts

print array_translate(["red", 3, "blue", 1]); # => "redredredblue"
puts

