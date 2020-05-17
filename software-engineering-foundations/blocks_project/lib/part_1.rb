def select_even_nums(arr)
  arr.select(&:even?)
end

def reject_puppies(dogsArr)
  dogsArr.reject { |dog| dog["age"] <= 2}
end