require 'sinatra'
require 'pg'

require 'sinatra/reloader' if development?

get '/' do
  erb :home
end

get '/hello' do
  # Old school terminall style
  # puts "What is your name"
  # @name = gets.chomp

  # Fetch this information from the query (URL)
  @name = params["person_name"]

  if @name
    erb :hello
  else
    # Send them home...
    redirect to("/")
  end
end


get '/players' do
  database = PG.connect(dbname: "sample_database")
  @players = database.exec("select * from players where shirt_size='XL'")

  erb :players
end
