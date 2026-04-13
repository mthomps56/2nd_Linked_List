class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value     = value
    @next_node = next_node
  end
end
 
class LinkedList
  attr_accessor :head, :tail, :size

  def initialize(value, tail = nil)
    @head = Node.new(value, tail)
    @tail = self.head
    @size = 1
    self.head.next_node = self.tail
  end

  def append(value)
    node = Node.new(value)
    self.tail.next_node = node
    self.tail = self.tail.next_node
 
    if self.head.nil?
       self.head = node 
       self.head.next_node = self.tail
    end
  end

  def traverse
    current = self.head
    size = self.size
    while current
      info = yield current, size 
      current = current.next_node
    end
    return info
  end
end

list = LinkedList.new(42)
list.append(13)
list.traverse { | current, size | puts current.value }

