

def exponentiation(number, power)
  return number if power <= 1
  number * exponentiation(number, power-1)
end

def range(start, finish)
  return [] if start >= finish
  range(start, finish-1) << (finish-1)
end

class Array
  def deep_dup
    new_array = []
    self.each do |el|
      new_array << (el.is_a?(Array) ? deep_dup(el) : el)
    end
    new_array
  end
end

def fibonacci(num)
  fib_nums = [1, 1]
  return fib_nums.take(num) if num <=2
  fib = fibonacci(num-1)
  fib << fib[-1] + fib[-2]
end

def subsets(arr)
  return [[]] if arr.length == 0
  subs = subsets(arr[0...-1])
  subs + subs.map { |sub| sub + [arr[-1]] }
end
