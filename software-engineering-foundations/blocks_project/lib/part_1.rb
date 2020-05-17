def select_even_nums(arr)
  arr.select(&:even?)
end

def reject_puppies(dogsArr)
  dogsArr.reject { |dog| dog["age"] <= 2}
end

def count_positive_subarrays(arr)
  arr.count { |subArr| subArr.sum > 0 }
end

def aba_translate(str)
  str.split("").map { |char| "aeiou".include?(char) ? char + "b" + char : char }.join("")
end

def aba_array(arr)
  arr.map { |el| aba_translate(el) }
end