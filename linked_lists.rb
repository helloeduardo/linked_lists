require_relative "node"

class LinkedList
  attr_reader :head, :size

  def initialize
    @head = Node.new
    @size = 1
  end

  def prepend(value)
    @head = Node.new(value, head)
    @size += 1
  end

  def traverse
    pointer = head
    until pointer.next_node == nil
      pointer = pointer.next_node
    end
    pointer
  end

  def append(value)
    last = traverse
    last.next_node = Node.new(value)
    @size += 1
  end

  def at(index)
    pointer = head
    index.times do
      pointer = pointer.next_node
    end
    pointer
  end
end

list = LinkedList.new
puts list.prepend(12)
puts list.append(33)
puts list.inspect
puts list.size
puts list.head
puts list.at(2)
