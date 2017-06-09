def my_min(arr)
  smallest = 10**999
  (0..arr.count-2).each do  |i|
    (i+1..arr.count-1).each do |j|
      if arr[i] < arr[j]
        smallest = arr[i]
      end
    end
  end
  smallest
end
#O(n^2)

def my_min_ii(arr)
  smallest = 10**999
  arr.each do |element|
    if element < smallest
      smallest = element
    end
  end
  smallest
end
#O(n)

def largest_contiguous_subsum(list)
  subsets = []
  (0..list.length-1).each do |i|
    (i..list.length-1).each do |j|
      subsets << list[i..j]
    end
  end
  subsets.map! do |sub_arr|
    sub_arr.reduce(:+)
  end
  subsets.max
end
#O(n**2)

def largest_contiguous_subsum_ii(list)
  return 0 if list.empty?
  max_sum = list[0]
  min_sum = 0
  current_sum = 0
  list.each do |el|
    current_sum += el
    if current_sum - min_sum > max_sum
      max_sum = sum - min_sum
    end
    if current_sum < min_sum
      min_sum = current_sum
    end
  end
  max_sum
end

list1 = [2, 3, -6, 7, -6, 7]
list2 = [-5, -1, -3]
p largest_contiguous_subsum_ii(list1) == 8
p largest_contiguous_subsum_ii(list2) == -1
