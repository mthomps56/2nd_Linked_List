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
    @tail = head
    @size = 1
    head.next_node = self.tail
  end

  def append(value)
    node = Node.new(value)
    tail.next_node = node
    self.tail = tail.next_node

    return unless head.nil?

    self.head = node
    head.next_node = tail
  end

  def prepend(value)
    temp = head
    self.head = Node.new(value, temp)
  end

  def list_size(counter = 0)
    return 0 if head.nil?

    current = head
    while current
      current = current.next_node
      counter += 1
    end
    self.size = counter
  end

  def show_head
    head.nil? ? (return nil) : (return head.value)
  end

  def at(index)
    current = head
    counter = 0
    while current
      current = current.next_node
      counter += 1
      return current.value if counter.eql?(index)
    end
    nil
  end

  def pop
    return nil if head.nil?

    node = head
    self.head = head.next_node
    node.value
  end

  def traverse(value = nil)
    current = head
    while current
      info = yield current, value, 0
      current = current.next_node
    end
    info
  end

  def contains(value)
    traverse(value) { |curr, val| curr.value.eql?(val) || false }
  end

  def index(value)
    traverse(value) { |curr, val, count| return count if curr.value.eql?(val) }
  end

   def insert_at(index, *values)
     current, counter = self.head, 0
     while current
       if index.eql?(counter)
         tmp = current.next_node
         values.each do |val| 
           current.next_node = Node.new(value)
           current = current.next_node
         end
         tmp = current.next_node
         return to_s
       end
       current = current.next_node
     end
   end

  def to_s
    current = head
    while current
      unless current.nil?
        print "( #{current.value} ) -> "
        current = current.next_node
      else
        print 'nil' if current.nil?
      end
    end
  end
end
