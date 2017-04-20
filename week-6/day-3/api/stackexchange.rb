require 'ap'
require_relative 'stack_overflow'

overflow = StackOverflow.new
ap overflow.questions(2)
