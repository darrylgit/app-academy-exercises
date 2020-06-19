def my_reject(arr, &prc)
  arr.select { |el| !prc.call(el) }
end

