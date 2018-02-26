class Deque
  attr_reader :length

  def initialize(starting_items = [], size = 8)
    @items = Array.new(size)
    @start_idx = 0
    @length = 0
    starting_items.each do |el|
      push(el)
    end
  end

  def first
    byebug if self[0].nil?
    self[0]
  end

  def last
    self[length - 1]
  end

  def empty?
    self.length == 0
  end

  def size
    items.length
  end

  def pop_push(val, &prc)
    until empty? || prc.call(last)
      pop
    end
    push(val)
  end

  def push(val)
    resize! if length == size
    self[length] = val
    self.length += 1
    self
  end

  def pop
    val = self[length - 1]
    self[length - 1] = nil
    self.length -= 1
    val
  end

  def shift(val)
    resize! if length == size
    self[-1] = val
    self.start_idx = (start_idx - 1) % size
    self.length += 1
    self
  end

  def unshift
    val = self[0]
    self[0] = nil
    self.start_idx = (start_idx + 1) % size
    self.length -= 1
    val
  end

  def [](idx)
    items[(start_idx + idx) % size]
  end

  def []=(idx, val)
    items[(start_idx + idx) % size] = val
  end

  private

  attr_accessor :items, :start_idx
  attr_writer :length

  def resize!
    self.items = (
      items.drop(start_idx)
      + items.take(start_idx)
      + Array.new(size)
    )
  end
end

def window_range(arr, window_size)
  max_queue = Deque.new
  min_queue = Deque.new
  arr.take(window_size).each do |el|
    max_queue.pop_push(el) { |last| el < last }
    min_queue.pop_push(el) { |last| el > last }
  end

  max_range = max_queue.first - min_queue.first

  arr.drop(window_size).each_with_index do |el, idx|
    max_queue.pop_push(el) { |last| el < last }
    max_queue.unshift if arr[idx] == max_queue.first

    min_queue.pop_push(el) { |last| el > last }
    min_queue.unshift if arr[idx] == min_queue.first

    this_range = max_queue.first - min_queue.first
    max_range = this_range if this_range > max_range
  end

  max_range
end
