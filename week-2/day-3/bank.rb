# Nouns
# ✅ name
# ✅ account_number
# ✅ routing_number
# ✅ type (checking or savings)
# ✅ balance

# Verbs
# ✅ check balance
# ✅ withdraw
#   What information does this need?
#     - how much
#     - current balance
#   What work do we need to do?
#     - subtract how much to the current balance and put in new balance
#     - store that in the current balance
#   Output (return)
#     - return the new balance
# ✅ deposit
#   What information does this need?
#     - how much
#     - current balance
#   What work do we need to do?
#     - add how much to the current balance
#     - store that in the current balance
#   Output (return)
#     - return the new balance
#   - interest deposit
# transfer
class BankAccount
  attr_reader "name", "balance", "account_number", "routing_number", "type"

  def initialize(name, account_number, routing_number, type, balance)
    @name = name
    @account_number = account_number
    @routing_number = routing_number
    @type = type
    @balance = balance
  end

  # withdraw
  #   What information does this need?
  #     - how much
  #     - current balance
  #   What work do we need to do?
  #   Output (return)
  #     - return the new balance
  def withdraw(amount)
    if amount < 0
      puts "Nice try hacker!"
    else
      #     - subtract how much from the current balance and put in new balance
      new_balance = @balance - amount
      #     - store that in the current balance
      @balance = new_balance
    end

    return @balance
  end

  # deposit
  #   What information does this need?
  #     - how much (amount)
  #     - current balance
  #   What work do we need to do?
  #   Output (return)
  #     - return the new balance
  def deposit(amount)
    if amount < 0
      puts "What? really?"
    else
      puts "-- Transaction log. Depositing #{amount} into #{@name} account (#{@type}) with a current balance of #{@balance}"
      #     - add how much to the current balance
      new_balance = amount + @balance
      #     - store that in the current balance
      @balance = new_balance
    end

    return @balance
  end
end

accounts = []

loop do
  puts "What is the person's name?"
  name = gets.chomp

  if name.empty?
    break
  end

  puts "What is their account number?"
  account_number = gets.chomp.to_i

  puts "What is their routing number?"
  routing_number = gets.chomp.to_i

  puts "What is their account type"
  type = gets.chomp

  puts "What is their balance?"
  balance = gets.chomp.to_i

  account = BankAccount.new(name, account_number, routing_number, type, balance)
  puts "The #{account.type} balance for #{account.name}'s account is #{account.balance}"

  accounts << account
end

puts "The bank has #{accounts.count} accounts."

# add that account's balance to the total balance
# when done, total balance will be the total balance at the bank

# Go through each account at the bank (accounts)
total_balance = 0
accounts.each do |account|
  total_balance += account.balance
end
puts "The total balance is #{total_balance}"

total_checking_balance = 0
accounts.each do |account|
  if account.type == "checking"
    total_checking_balance += account.balance
  end
end
puts "The total checking balance is #{total_checking_balance}"

#
