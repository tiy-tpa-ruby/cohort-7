
class Dog
  def initialize(dog_name, age)
    @name = dog_name
    @age  = age
    @pizza_party = "Pizza!"
  end

  def method_missing(method_name, *args, &block)
    variable_name = "@#{method_name.to_s.gsub(/=\Z/, '')}".to_sym

    if method_name.to_s.end_with?("=")
      instance_variable_set(variable_name, args.first)
    else
      if instance_variables.include?(variable_name)
        return instance_variable_get(variable_name)
      else
        super
      end
    end
  end
end

dog = Dog.new("Riley", 2)

dog.name     = "Roxy"
p dog.name
p dog.age
p dog.pizza_party



#
