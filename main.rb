class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value     = value
    @next_node = next_node
  end
end
 
class LinkedList
  attr_accessor :head, :tail

  def initialize(value, tail = nil)
    @head = Node.new(value, tail)
    @tail = self.head
    @size = 1
  end

  def append(value)
    node = Node.new(value)
    self.head = node if self.head.nil?
    self.tail.next_node = node
    self.tail = self.tail.next_node
  end
end

list = LinkedList.new(42)
puts list.head.value
puts list.tail.value
