name = 'gavin'

def print_something
  name = 'Toni'
  puts name
end

print_something
puts name

class Person
  def initialize(person_name)
    @name = person_name
  end

  def name
    return @name
  end

  def greet
    puts "hello #{name}"
  end

  def self.count
    return 1
  end
end

person = Person.new("Jason")
person.greet

#
