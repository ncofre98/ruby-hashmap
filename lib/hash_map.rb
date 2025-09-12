require_relative 'node'
require_relative 'linked_list'

class HashMap
  attr_accessor :bucket, :capacity, :size
  attr_reader :load_factor
  
  def initialize
    @capacity = 16
    @load_factor = 0.8
    @bucket = [nil] * capacity
    @size = 0
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
    
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    
    hash_code
  end

  def rehash
    self.capacity *= 2
    self.bucket = [nil] * capacity
    all_entries = entries()

    all_entries.each { |entry| set(entry[0], entry[1]) }
  end

  def set(key, value)
    hashed = hash(key) % capacity
    inserted = true
    
    if bucket[hashed]
      inserted = bucket[hashed].set(key, value)
    else
      if size > load_factor * capacity
        rehash()
        hashed = hash(key) % capacity
      end
      ll = LinkedList.new
      ll.append(key, value)
      bucket[hashed] = ll
    end

    self.size += 1 if inserted
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
    if bucket[hashed].nil?
      nil
    else
      self.size -= 1
      bucket[hashed].remove(key)
    end
  end

  def length
    size
  end

  def clear
    initialize
  end

  def keys
    all_keys = []
    bucket.compact.each { |b| all_keys += b.get_all('key') }
    all_keys
  end

  def values
    all_values = []
    bucket.compact.each { |b| all_values += b.get_all('value') }
    all_values
  end

  def entries
    all_entries = []
    bucket.compact.each { |b| all_entries += b.get_all('entries') }
    all_entries
  end
end
