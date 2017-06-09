def bad_two_sum?(arr, target)
  (0..arr.length-2).each do |i|
    (i+1..arr.length-1).each do |j|
      if arr[i] + arr[j] == target
        return true
      end
    end
  end
  false
end

# O(n**2)
def binary_search(arr, val)
  binary_search_helper(arr, val, 0, arr.length)
end

def binary_search_helper(arr, val, start, endding)
  mid = (start + endding) / 2
  return nil if arr.length <= 1 && arr[0] != val
  return true if arr[mid] == val
  if val < arr[mid]
    binary_search_helper(arr, val, start, mid)
  else
    binary_search_helper(arr, val, mid, endding)
  end
end

def okay_two_sum?(arr, target)
  sorted = arr.sort
  (0..sorted.length-2).each do |i|
    remainder = target - sorted[i]
    if binary_search(sorted, remainder)
      return true
    end
  end
  false
end
#O(nlogn)

def two_sum?(arr, target)
  our_hash = Hash.new()
  arr.each do |el|
    our_hash[target-el] = el
  end
  our_hash.each do |k, v|
    if k != v && k == our_hash[v]
      return true
    end
  end
  false
end

# O(n)
