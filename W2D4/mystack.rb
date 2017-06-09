class MyStack

  def initialize
    @store = []
    @max_stack = []
    @min_stack = []
  end

  def pop
    @max_stack.pop
    @min_stack.pop
    @store.pop
  end

  def push(el)
    @store.push(el)
    if @max_stack.empty?
      @max_stack.push(el)
    elsif el > @max_stack[-1]
      @max_stack.push(el)
    else
      @max_stack.push(@max_stack[-1])
    end
    if @min_stack.empty?
      @min_stack.push(el)
    elsif el < @min_stack[-1]
      @min_stack.push(el)
    else
      @min_stack.push(@min_stack[-1])
    end
    @store
  end

  def max
    @max_stack[-1]
  end

  def min
    @min_stack[-1]
  end

  def peek
    @store[-1]
  end

  def size
    @store.length
  end

  def empty?
    @store.length == 0
  end
end
