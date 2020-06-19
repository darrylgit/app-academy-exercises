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

def hash_select(hash, &prc)
  new_hash = Hash.new()
  hash.each { |key, val| new_hash[key] = val if prc.call(key, val) }
  new_hash
end

def xor_select(arr, prc1, prc2)
  arr.select { |el| [prc1.call(el), prc2.call(el)].one? }
end