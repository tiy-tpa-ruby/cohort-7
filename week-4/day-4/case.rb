score = 100

case score
# Is score a string?
when String
  puts "No way, I only work with numbers"
# is the score a 0
when 0
  puts "WHAT?"
# is score in the range 1 through 69 (Not include 70)
when (1...70)
  puts "F"
# is score in the range 70 through 80
when (70..80)
  puts "D"
else
  puts "Didn't find a match"
end


# IRB examples

# Think of === as "is a kind of" (but more powerful)
# and the form is
#
#  a === b
#  is `b` a kind of `a`
#
#  === is not reflexive meaning
#
#  a === b  does *NOT* imply   b === a
#
# See the range example below

String === "I am a string"   # => true
String === 42                # => false
0 === 42                     # => false
42 === 42                    # => true
(1..70) === 42               # => true
42 === (1..70)               # => false
