class Map
  def initialize
    @values = []
  end

  def assign(key, value)
    idx = self.find(key)
    if idx.nil?
      values.push([key, value])
    else
      values[idx] = [key, value]
    end
  end

  def lookup(key)
    idx = self.find(key)
    idx && values[idx][1]
  end

  def remove(key)
    idx = self.find(key)
    values.delete(idx) unless idx.nil?
  end

  def show
    @values
  end

  protected

  attr_reader :values

  def find(key)
    values.each_index do |idx|
      return idx if values[idx][0] == key
    end
    nil
  end
end

if $PROGRAM_NAME == __FILE__
  m = Map.new
  m.assign(:a, 1)
  m.assign(:b, 2)
  m.assign(:c, 3)
  p m.show
  m.assign(:b, 50)
  p m.show
  p m.lookup(:a)
  p m.lookup(1)
  m.remove(:b)
  m.remove(:a)
  p m.show
end
