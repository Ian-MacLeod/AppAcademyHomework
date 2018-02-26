class Queue
  def initialize
    @els = []
  end

  def enqueue(el)
    @els << el
  end

  def dequeue
    @els.shift
  end

  def show
    @els
  end
end


if $PROGRAM_NAME == __FILE__
  q = Queue.new
  q.enqueue(1)
  q.enqueue(2)
  q.enqueue(3)
  q.dequeue
  p q.show
  q.enqueue(4)
  p q.show
  q.dequeue
  p q.show
end
