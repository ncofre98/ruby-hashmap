require_relative 'lib/hash_map'

hashmap = HashMap.new
hashmap.set('gato', 'solovino')
hashmap.set('gata', 'mimi')
hashmap.set('gato', 'solovino el gato blanco y guapo')
hashmap.set('perro', 'canelástico')
hashmap.set('gata2', 'ninamaria')
p hashmap
p hashmap.length
p hashmap.keys
p hashmap.values
p hashmap.entries
#p hashmap
