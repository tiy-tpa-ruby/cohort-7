require 'httparty'
require 'sinatra'
require_relative 'swapi_attribute'
require_relative 'film'
require_relative 'character'

SWAPI_BASE_URL="http://swapi.co/api/"

get '/' do
  # Get the root list of API endpoints
  response = HTTParty.get(SWAPI_BASE_URL)

  @films = Film.all(response.parsed_response["films"])

  erb :films
end

get '/film/:index' do
  # Get the root list of API endpoints
  response = HTTParty.get(SWAPI_BASE_URL)

  films = Film.all(response.parsed_response["films"])

  @film_index = params[:index].to_i
  @film = films[@film_index]

  erb :film
end

get '/films/:film_index/characters/:character_index' do

end
