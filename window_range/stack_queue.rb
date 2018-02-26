class MinMaxStack
  def initialize
    @items = []
    @maxes = []
    @mins = []
  end

  def push(val)
    items.push(val)
    maxes << val if new_max?(val)
    mins << val if new_min?(val)
    self
  end

  def new_max?(val)
    maxes.empty? || val > maxes.last
  end

  def new_min?(val)
    mins.empty? || val < mins.last
  end

  def pop
    raise "no items" if items.empty?
    val = items.pop
    maxes.pop if val == maxes.last
    mins.pop if val == mins.last
    val
  end

  def max
    maxes.last
  end

  def min
    mins.last
  end

  def length
    items.length
  end

  def empty?
    items.empty?
  end

  private

  attr_reader :items, :maxes, :mins
end

class MinMaxStackQueue
  def initialize
    @in_stack = MinMaxStack.new
    @out_stack = MinMaxStack.new
  end

  def enqueue(val)
    in_stack.push(val)
    self
  end

  def dequeue
    transfer_stack if out_stack.empty?
    out_stack.pop
  end

  def max
    in_max = in_stack.max
    out_max = out_stack.max
    return out_max if in_max.nil?
    return in_max if out_max.nil?
    [in_max, out_max].max
  end

  def min
    in_min = in_stack.min
    out_min = out_stack.min
    return out_min if in_min.nil?
    return in_min if out_min.nil?
    [in_min, out_min].min
  end

  def length
    in_stack.length + out_stack.length
  end

  private

  attr_reader :in_stack, :out_stack

  def transfer_stack
    until in_stack.empty?
      out_stack.push(in_stack.pop)
    end
  end
end

def window_range(arr, window_size)
  max_range = nil
  queue = MinMaxStackQueue.new
  arr.each do |el|
    queue.enqueue(el)
    next if queue.length < window_size

    this_range = queue.max - queue.min
    max_range = this_range if max_range.nil? || this_range > max_range

    queue.dequeue
  end

  max_range
end
