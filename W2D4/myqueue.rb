class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store.unshift(el)
  end

  def dequeue
    @store.pop
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
