class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(max_size)
    @buffer = []
    @max_size = max_size
  end

  def read
    raise BufferEmptyException if @buffer.empty?
    @buffer.shift
  end

  def write(item)
    raise BufferFullException if buffer_full?
    @buffer << item unless item.nil?
  end

  def write!(item)
    return if item.nil?
    read if buffer_full?
    @buffer << item
  end

  def clear
    @buffer.clear
  end

  private

  def buffer_full?
    @buffer.size >= @max_size
  end
end
