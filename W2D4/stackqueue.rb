require_relative 'mystack'

class StackQueue

  def initialize
    @receiving_stack = []
    @giving_stack = []

  end

  def enqueue(el)
    @receiving_stack.push(el)
  end

  def dequeue
    if @giving_stack.empty?
      until @receiving_stack.empty?
        @giving_stack << @receiving_stack.pop
      end
    end
    @giving_stack.pop
  end

  def size
    @giving_stack.length  + @receiving_stack.length
  end

  def empty?
    @giving_stack.empty? && @receiving_stack.empty?
  end
end

class MyMinMax
  def initialize
    @max = []
    @min = []
  end

end
