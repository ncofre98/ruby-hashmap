require_relative 'node'
require_relative 'linked_list'

class HashMap
  LOAD_FACTOR = 0.8

  
  attr_accessor :bucket, :capacity

  
  def initialize
    @capacity = 16
    @bucket = [nil] * 16
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
    
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    
    hash_code
  end

  def set(key, value)
    hashed = hash(key) % capacity
    if bucket[hashed]
      bucket[hashed].set(key, value)
    else
      ll = LinkedList.new
      ll.append(key, value)
      bucket[hashed] = ll
    end
  end

  def get(key)
    hashed = hash(key) % capacity
    bucket[hashed].nil? ? nil : bucket[hashed].get(key)
  end

  def has?(key)
    hashed = hash(key) % capacity
    bucket[hashed].nil? ? false : bucket[hashed].contains?(key)
  end

  def remove(key)
    hashed = hash(key) % capacity
    bucket[hashed].nil? ? nil : bucket[hashed].remove(key)
  end
end
