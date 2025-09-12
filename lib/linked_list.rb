class LinkedList
  attr_accessor :head, :tail
  
  def initialize
    @head = nil
    @tail = nil
  end

  def append(key = nil, value)
    node = Node.new(key, value)
    if head.nil?
      self.head = node
      self.tail = head
    else
      tail.next_node = node
      self.tail = tail.next_node
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

  def contains?(key)
    current = head
    while current
      return true if current.key == key
      current = current.next_node
    end
    false
  end

  def find(key)
    current = head
    index = 0
    while current
      return index if current.key == key
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

  #Returns false if value was modified, true if new node was inserted
  def set(key, value)
    current = head
    while current
      if current.key == key
        current.value = value
        return false
      else
        current = current.next_node
      end
    end
    self.tail.next_node = Node.new(key, value)
    self.tail = self.tail.next_node
    true
  end

  def get(key)
    current = head
    while current
      return current.value if current.key == key
      current = current.next_node
    end
    nil
  end

  def remove(key)
    deleted = nil
    if head.key == key
      deleted = head.value
      self.head = head.next_node
    else
      current = head
      while current
        if current.next_node.key == key
          deleted = current.next_node.value
          current.next_node = current.next_node.next_node
          break
        end
        current = current.next_node
      end
    end
    deleted
  end

  def get_all(req)
    arr = []
    current = head
    if ['key', 'value'].include?(req)
      while current
        arr << current.send(req)
        current = current.next_node
      end
    elsif req == 'entries'
      while current
        arr << [current.key, current.value]
        current = current.next_node
      end
    end
    
    arr
  end
  
end
