class LinkedList
  attr_accessor :head, :tail, :size
  
  def initialize
    @head = nil
  end

  def append(value)
    node = Node.new(value)
    if head.nil?
      self.head = node
    else
      current = head
      while current.next_node
        current = current.next_node
      end
      current.next_node = node
    end
  end

  def prepend(value)
    node = Node.new(value)
    if head.nil?
      self.head = node
    else
      node.next_node = self.head
      self.head = node
    end
  end

  def size
    return 0 if head.nil?
    size = 1
    current = head
    while current.next_node
      size += 1
      current = current.next_node
    end
    size
  end

  def tail
    return nil if head.nil?
    current = head
    while current.next_node
      current = current.next_node
    end
    current
  end

  def at(index)
    current = head
    while current.next_node && index != 0
      current = current.next_node
      index -= 1
    end
    #If index is bigger than the list's size - 1, nil is returned
    index != 0 ? nil : current
  end

  def pop
    if !head || !head.next_node
      self.head = nil
      return
    end
    current = head
    while current.next_node.next_node
      current = current.next_node
    end
    current.next_node = nil
  end

  def contains?(value)
    current = head
    while current
      return true if current.value == value
      current = current.next_node
    end
    false
  end

  def find(value)
    current = head
    index = 0
    while current
      return index if current.value == value
      current = current.next_node
      index += 1
    end
    nil
  end

  def to_s
    current = head
    string = ""
    while current
      string += "( #{current.value} ) -> "
      current = current.next_node
    end
    string += "nil"
    string
  end

  #Extra credit
  def insert_at(value, index)
    if index == 0
      prepend(value)
    else
      node = Node.new(value)
      current = head
      while current
        index -= 1
        if index == 0
          node.next_node = current.next_node
          current.next_node = node
          return
        end
        current = current.next_node
      end
    end
  end

  def remove_at(index)
    if index == 0
      self.head = head.next_node
      return
    end
    current = head
    while current
      index -= 1
      if index == 0
        current.next_node = current.next_node.next_node if !current.next_node.nil?
        return
      end
      current = current.next_node
    end
  end
end
