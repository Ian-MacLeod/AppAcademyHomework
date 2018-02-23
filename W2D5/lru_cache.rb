class LRUCache
  def initialize(max_size)
    @items = []
    @max_size = max_size
  end

  def count
    # returns number of elements currently in cache
    items.length
  end

  def add(el)
    # adds element to cache according to LRU principle
    items.delete(el) if items.include?(el)
    items.shift if count >= max_size
    items.push(el)

    self
  end

  def show
    # shows the items in the cache, with the LRU item first
    items.dup
  end

  private

  # helper methods go here!
  attr_reader :items, :max_size
end
