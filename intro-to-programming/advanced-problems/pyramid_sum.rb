# For example, the base [1, 4, 6] gives us the following pyramid
#     15
#   5   10
# 1   4    6

def pyramid_sum(base)
  pyramid = [base]

  while pyramid[0].length > 1
    layer = []

    i = 1
    while i < pyramid[0].length
      layer << pyramid[0][i -1] + pyramid[0][i]
      i += 1
    end

    pyramid.unshift(layer)
  end

  return pyramid
end

print pyramid_sum([1, 4, 6]) #=> [[15], [5, 10], [1, 4, 6]]
puts

print pyramid_sum([3, 7, 2, 11]) #=> [[41], [19, 22], [10, 9, 13], [3, 7, 2, 11]]
puts