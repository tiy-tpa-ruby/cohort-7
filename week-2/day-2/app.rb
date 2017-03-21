print "Do you want to work with [numbers] or [strings]? "
choice = gets.chomp

if choice == "numbers"
  numbers = []
  loop do
    print "Please give me your number: "
    number = gets.chomp

    if number.empty?
      break
    end

    numbers << number.to_f
  end

  total = numbers.sum
  average = total / numbers.length

  puts "The total of your numbers is #{total}"
  puts "The average of your numbers is #{average}"
end

if choice == "strings"
  strings = []
  loop do
    print "Please give me your string: "
    string = gets.chomp

    if string.empty?
      break
    end

    strings << string
  end

  puts "Your long string is #{strings.join}"
end








#
