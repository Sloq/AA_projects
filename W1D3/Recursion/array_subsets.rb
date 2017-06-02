def subsets(array)
  return [[]] if array.empty?

  arr_to_add = subsets(array[0...array.length-1])
  arr_to_add += arr_to_add.map { |sub_arrays| sub_arrays + [array[-1]] }

end
