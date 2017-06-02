class Array

  def my_each(&prc)
    x = 0
    while x < self.length
      prc.call(self[x])
      x+=1
    end

  self
  end

  def my_select(&prc)
    result = []

    self.my_each do |num|
      result << num if prc.call(num) == true
    end
    result
  end

  def my_reject(&prc)
    result = []
    self.my_each do |num|
      result << num if prc.call(num) == false
    end
    result
  end

  def my_any?(&prc)
    self.my_each do |num|
      return true if prc.call(num) == true
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |num|
      return false if prc.call(num) == false
    end
    true
  end

  def my_flatten
    result = []

    self.my_each do |num|
      if num.class == Array
        result += num.my_flatten
      else
        result << num
      end
    end

    result
  end

  def my_zip(*args)
    result = []
    self.each_index do |x|
      temp = []
      temp << self[x]
      args.each do |y|
        if x > args.length
          temp << nil
        else
          temp << y[x]
        end
      end
      result << temp
    end
    result
  end

  def my_rotate(num = 1)
    result = []

    self.each_index do |idx|
      result << self[(idx+num)%self.length]
    end

    result
  end

  def my_join(separator = "")
    result = ""

    self.each_index do |l|
      result += self[l]
      result += separator unless l == self.length-1
    end

    result
  end

  def my_reverse
    result = []

    self.each_index do |idx|
      result.unshift(self[idx])
    end

    result
  end
end

# calls my_each twice on the array, printing all the numbers twice.
return_value = [1, 2, 3].my_each do |num|
 puts num
end.my_each do |num|
 puts num
end

p return_value  # => [1, 2, 3]

a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []

a = [1, 2, 3]
p a.my_reject { |num| num > 1 } # => [1]
p a.my_reject { |num| num == 4 } # => [1, 2, 3]

a = [1, 2, 3]
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true


p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)

a = [ "a", "b", "c", "d" ]
p a.my_rotate         #=> ["b", "c", "d", "a"]
p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

a = [ "a", "b", "c", "d" ]
p a.my_join         # => "abcd"
p a.my_join("$")    # => "a$b$c$d"

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]
