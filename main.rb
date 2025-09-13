require_relative 'lib/hash_map'

test = HashMap.new
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')
test.set('lion', 'solovino')
test.set('dog', 'canelastico')

p test
puts "\n"

test.set('moon', 'silver')

p test
p test.length
p test.entries

test.set('moon', 'rosita_spain')
p test
p test.entries

