def my_reject(arr, &prc)
  arr.select { |el| !prc.call(el) }
end

def my_one?(arr, &prc)
  got_one = false;
  arr.each do |el|
    if prc.call(el)
      if !got_one
        got_one = true
      elsif got_one
        return false
      end
    end
  end

  return got_one
end