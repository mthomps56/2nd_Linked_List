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

  def prepend(value)
    temp = self.head
    self.head = Node.new(value, temp)
  end

  def list_size(counter = 0)
    return 0 if self.head.nil? 
    current = self.head
    while current
      current = current.next_node
      counter += 1
    end
    self.size = counter
  end

  def show_head
    self.head.nil? ? (return nil) : (return self.head.value)
  end

  def at(index)
    current = self.head
    counter = 0
    while current
      current = current.next_node
      counter += 1
      return current.value if counter.eql?(index)
    end
    return nil
  end

  def pop
    return nil if self.head.nil?
    node = self.head
    self.head = self.head.next_node
    return node.value
  end

  def traverse(value = nil)
    current = self.head
    while current
      info = yield current, value, count = 0
      current = current.next_node
    end
    return info
  end

  def contains(value)
    return traverse(value) { | curr, val | curr.value.eql?(val) ? true : false }
  end

  def index(value)
    traverse(value) { | curr, val, count | return count if curr.value.eql?(val) }
  end

end

list = LinkedList.new(42)
list.append(13)
list.prepend(1)
list.traverse { | current | puts current.value }
x = list.pop
puts; puts;
puts x
puts; puts;
list.traverse { | current | puts current.value }
puts; print list.contains(3)
puts
puts list.index(13)
