require_relative 'magic_record'

class Dog < MagicRecord
end

dog = Dog.new(name: "Roxy", age: "13", pizza_party: "nom nom nom")
p dog.name
p dog.age
p dog.pizza_party

dog = Dog.find(1)
p dog.name
p dog.age
p dog.id
p dog.pizza_party

class Toy < MagicRecord
end

toy = Toy.find(1)
p toy
