print "What is your name? "
name = gets.chomp

print "What is your age? "
age = gets.chomp.to_i

if age > 6 && name == "Gavin"
  puts "You really should try Space Mountain"
end

if (age < 6 || age > 70) && name == "Gavin"
  puts "You are not allowed to ride"
else
  puts "Welcome aboard!"
end

# print "Do you want to work with [numbers] or [strings]? "
# choice = gets.chomp
#
# if choice == "numbers"
#   puts "You typed in numbers"
# elsif choice == "strings"
#   puts "You typed in strings"
# else
#   puts "You typed something wrong, try again silly!"
# end
