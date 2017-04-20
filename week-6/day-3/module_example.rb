module Salaried
  def salary=(new_salary)
    @salary = new_salary
  end

  def salary
    return @salary
  end
end

module GithubAccess
  def github_token=(new_token)
    @token = new_token
  end

  def github_token
    "GITHUB:#{@token}"
  end
end

class Person
  attr_accessor :name
end

class Contractor < Person
  include Salaried
end

class Employee < Person
  include Salaried
  include GithubAccess
end

gavin = Employee.new
gavin.name = "Gavin Stark"
gavin.salary = 1_000_000
gavin.github_token = "DEADBEEF"
puts "The person named #{gavin.name} is paid #{gavin.salary} and token is #{gavin.github_token}"

jason = Contractor.new
jason.name = "Jason Perry"
jason.salary = 2_000_000
jason.github_token = "FOOBAR"
puts "The person named #{jason.name} is paid #{jason.salary}"
