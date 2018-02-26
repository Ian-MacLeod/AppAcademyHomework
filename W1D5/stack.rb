class Stack
  def initialize
    # create ivar to store stack here!
    @els = []
  end

  def add(el)
    # adds an element to the stack
    @els << el
  end

  def remove
    # removes one element from the stack
    @els.pop
  end

  def show
    # return a copy of the stack
    self
  end
end

if $PROGRAM_NAME == __FILE__
  stack = Stack.new
  stack.add(1)
  stack.add(2)
  stack.remove
  stack.add(3)
  stack.add(4)
  p stack.show
  stack.remove
  stack.remove
  stack.remove
  p stack.show
end
