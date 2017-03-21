class Dog
  attr_reader "name", "age", "breed", "bark"

  def initialize(name_of_dog, age_of_dog, breed_of_dog, bark_of_dog)
    @name = name_of_dog
    @age = age_of_dog
    @breed = breed_of_dog
    @bark = bark_of_dog
  end

  # def age
  #   return @age
  # end
  #
  # def name
  #   return @name
  # end
  #
  # def breed
  #   return @breed
  # end

  def enjoy_sun?
    true
  end

  def greeting
    "My name is #{name}, I am #{age} years old and I'm a #{breed} and says #{bark}"
  end
end

# Long hand version of making an array
names = Array.new

# Literal syntax for making an array
names = []

# No literal syntax for our own classes, only the long hand
dog = Dog.new("Bogie", 4, "Golden Retriever", "bark!")
puts dog.greeting

second_dog = Dog.new("Bella", 10, "Pitlab", "BARK!")
puts second_dog.greeting


#
