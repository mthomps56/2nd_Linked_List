require_relative 'lib/LinkedList'

list = LinkedList.new(42)
list.append(13)
list.prepend(1)
list.traverse { |current| puts current.value }
x = list.pop
puts
puts
puts x
puts
puts
list.traverse { |current| puts current.value }
puts
print list.contains(3)
puts
puts list.index(13)
list.append(5923)
list.append(234)
list.append('hi')
puts list

puts; puts; puts list.insert_at(1, 34, 526, 65)
