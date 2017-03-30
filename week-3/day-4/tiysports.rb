# Give ruby some Postgres super powers
require 'pg'

# Postrgres, please connect to my database.
#
#    dbname: "sample_database"
#
#    is a hash, but since it is the *last* argument it can lose the {}
#
#    so this is the same as
#
#    database = PG.connect({dbname: "sample_database"})
#
#    but that is just shorthand for a hash that has a symbol as the key
#
#    database = PG.connect({:dbname => "sample_database"})
#
#    We will see the original syntax WAY more often, so lets get used to it.
database = PG.connect(dbname: "sample_database")

# Ok, `database`, please `exec`ute this SQL statement
rows = database.exec("select * from players")

# Rows is a PG::Result but it behaves like an array. It is `Enumerable`, so we can `each` it.
rows.each do |row|
  # every element in `rows` is a hash, we will call that variable `row` according to our naming rules
  #
  # To access the value we want, we give the name of the column AS A STRING
  #
  # So row["name"] gives us the name of the person from this row, etc.
  puts "There is a player named #{row["name"]} that lives at #{row["address"]} who is #{row["age"]} and wears a size #{row["shirt_size"]}"
end

# We can use complex queries, with joins, and limited column results.
rows = database.exec("select players.name, teams.mascot from players, teams, memberships where players.id = memberships.player_id and teams.id = memberships.team_id order by players.age;")
rows.each do |row|
  puts "The player named #{row["name"]} hangs out with #{row["mascot"]}"
end

# Let's insert some data via the `exec` command by using the SQL `insert` syntax
name = "); drop table users;"
age = 22
shirt_size = "XS"
address = "1234 Pine Street"
# Never ever write this code.... (cause you will be owned)
# database.exec("insert into players(name,age,shirt_size,address) value(#{name})")

# Write this code (not vulnerable to SQL Injection, sorry hackers.)
database.exec("insert into players(name,age,shirt_size,address) values($1, $2, $3, $4)",[name, age, shirt_size, address])
