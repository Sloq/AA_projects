def permutations(array)
  return [array] if array.length <= 1
  perms = permutations(array[0...-1])
  result = []
  p perms
  p perms[-1]
  perms += array.map.with_index do |perm, x|
     perms.take(x) + [array[-1]] + perms.drop(perms.length - x)
   end
end

def permu2(array)
  return [array] if array.length <= 1
  result = []
  array.each_with_index do |el, i|
    permu2(array[0...i] + array[i+1..-1]).each do |partial_arrays|
      p partial_arrays
      result << [el] + partial_arrays
    end
  end
  result
end
