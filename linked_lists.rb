require_relative "node"

class LinkedList
  attr_reader :head, :size

  def initialize(head = nil)
    @head = head
    @size = 0
  end

  def prepend(value)
    @head = Node.new(value, head)
    @size += 1
  end

  def tail
    pointer = head
    until pointer.next_node == nil
      pointer = pointer.next_node
    end
    pointer
  end

  def append(value)
    if head.nil?
      prepend(value)
    else
      tail.next_node = Node.new(value)
      @size += 1
    end
  end

  def at(index)
    pointer = head
    index.times do
      pointer = pointer.next_node
    end
    pointer
  end

  def pop
    new_tail = at(size - 2)
    popped = tail
    new_tail.next_node = nil
    @size -= 1
    popped
  end

  def contains?(value)
    pointer = head
    until pointer == nil
      return true if pointer.value == value
      pointer = pointer.next_node
    end
    false
  end

  def find(value)
    pointer = head
    index = 0
    until pointer == nil
      return index if pointer.value == value
      pointer = pointer.next_node
      index += 1
    end
    nil
  end

  def to_s
    pointer = head
    string = ""
    size.times do
      string += "( #{pointer.value} ) -> "
      pointer = pointer.next_node
    end
    string += "nil"
  end
end

list = LinkedList.new
list.append(67)
puts list.prepend(12)
puts list.append(33)
puts list.inspect
puts list.size
puts list.head
puts list.at(list.size-1)
puts list.pop
list.append(45)
puts list.inspect
puts list.contains?(12)
puts list.contains?(33)
puts list.contains?(45)
puts list.find(12)
puts list.find(45)
puts list.to_s
