class Character
  include SwapiAttribute

  def initialize(url)
    response = HTTParty.get(url)

    define_attributes(%w{name birth_year eye_color gender hair_color}, response.parsed_response)
  end
end
