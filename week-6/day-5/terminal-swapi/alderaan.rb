require 'httparty'
require_relative 'ap'
require_relative 'swapi_attribute'
require_relative 'film'
require_relative 'character'
require 'terminal-table'
require 'tty-prompt'

# When you run the program from the command line (say, ruby alderaan.rb),
# you are presented with a list of Star Wars movie titles to choose between.

class Menu
  SWAPI_BASE_URL="http://swapi.co/api/"

  def initialize
    # Get the root list of API endpoints
    response = HTTParty.get(SWAPI_BASE_URL)

    @films = Film.all(response.parsed_response["films"])
  end

  def show_choices(array_of_things, zero_message, choice_message)
    prompt = TTY::Prompt.new

    prompt.select(choice_message) do |menu|
      menu.per_page array_of_things.size + 1
      menu.choice zero_message, 0
      array_of_things.each_with_index do |thing, index|
        menu.choice yield(thing), index + 1
      end
    end
  end

  def main_menu
    loop do
      choice = show_choices(@films, "Exit", "What film do you want information on? ") do |film|
        film.title
      end

      return if choice == 0

      # When a user selects a title, they are presented with the opening crawl for the movie
      # and asked if they would like to learn more or select another title.
      show_film(@films[choice - 1])
    end
  end

  def show_film(film_to_show)
    puts film_to_show.opening_crawl

    loop do
      print "Learn more? [y/n]: "
      choice = gets.chomp.downcase
      return if choice == 'n'

      choice = show_choices(film_to_show.characters, "", "Choose a character: ") do |character|
        character.name
      end

      show_bio(film_to_show.characters[choice - 1])
    end
  end


  def show_bio(character)
    info = %w{name birth_year eye_color gender}.map do |attribute|
      [attribute.gsub("_", " "), character.send(attribute)]
    end

    puts Terminal::Table.new(rows: info)
  end
end

menu = Menu.new
menu.main_menu
