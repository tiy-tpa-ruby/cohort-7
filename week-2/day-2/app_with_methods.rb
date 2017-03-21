def ask_a_question(prompt)
  puts prompt

  answer = gets.chomp

  return answer
end

def compute_statistics_for_a_sequence_of_numbers
  numbers = []
  loop do
    number = ask_a_question("Please give me your number")

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

def concatenate_strings_the_user_types
  strings = []
  loop do
    string = ask_a_question("Please give me your string")

    if string.empty?
      break
    end

    strings << string
  end

  puts "Your long string is #{strings.join}"
end

choice = ask_a_question("Do you want to work with [numbers] or [strings]")

if choice == "numbers"
  compute_statistics_for_a_sequence_of_numbers
end

if choice == "strings"
  concatenate_strings_the_user_types
end








#
