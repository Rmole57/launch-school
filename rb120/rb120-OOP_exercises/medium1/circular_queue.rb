class CircularQueue
  def initialize(buffer_size)
    @buffer = Array.new(buffer_size)
    @next_idx = 0
    @oldest_idx = 0
  end

  def enqueue(obj)
    @oldest_idx = increment(@next_idx) unless @buffer[@next_idx].nil?
    @buffer[@next_idx] = obj
    @next_idx = increment(@next_idx)
  end

  def dequeue
    removed = @buffer[@oldest_idx]
    @buffer[@oldest_idx] = nil
    @oldest_idx = increment(@oldest_idx) unless removed.nil?
    removed
  end

  private

  def increment(idx)
    (idx + 1) % @buffer.size
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

# FURTHER EXPLORATION:

# class CircularQueue
#   def initialize(max_size)
#     @buffer = Array.new
#     @max_size = max_size
#   end

#   def enqueue(obj)
#     @buffer.push(obj)
#     dequeue if @buffer.size > @max_size
#   end

#   def dequeue
#     @buffer.shift
#   end
# end
