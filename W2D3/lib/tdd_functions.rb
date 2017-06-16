class Array

  def my_uniq
    arr = []
    each do |i|
      arr << i unless arr.include? i
    end
    arr
  end

  def two_sum
    arr = []
    each_index do |i|
      each_index do |j|
        next unless i < j
        arr << [i, j] if self[i] + self[j] == 0
      end
    end
    arr
  end

  def my_transpose
    arr = []
    self[0].each_index do |idx|
      new_row = []
      self.each do |row|
        new_row << row[idx]
      end
      arr << new_row
    end
    arr
  end

  def stock_picker
    best_arr = [0,1]
    each_index do |i|
      each_index do |j|
        next unless i < j
        if self[j] - self[i]  > self[best_arr[1] - self[best_arr[0]]]
          best_arr = [i, j]
        end
      end
    end
    best_arr
  end

end
