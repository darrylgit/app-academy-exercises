def selected_map!(arr, prc1, prc2)

  arr.each_with_index do |el, i|
    arr[i] = prc2.call(el) if prc1.call(el)
  end

  nil
end