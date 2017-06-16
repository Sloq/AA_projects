def windowed_max_range(arr, window_size)
  return arr.max - arr.min if arr.length <= window_size
  current_max_range = nil
  (0..arr.length-window_size).each do |i|
    window = arr[i..i+window_size-1]
    diff = window.max - window.min
    current_max_range = diff if current_max_range.nil?
    if current_max_range < diff
      current_max_range = diff
    end
  end
  current_max_range
end
# O(n * window_size) ~ O(n ** 2)



if __FILE__ == $PROGRAM_NAME
  p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
  p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
  p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
  p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
end
