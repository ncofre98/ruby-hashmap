require_relative 'lib/hash_map'

hashmap = HashMap.new
hashmap.set('gato', 'solovino')
hashmap.set('gata', 'mimi')
hashmap.set('gato', 'solovino el gato blanco y guapo')
p hashmap
p hashmap.remove('gato')
#p hashmap
