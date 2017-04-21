class Film
  include SwapiAttribute

  # Return all the film objects by asking the API for them
  def self.all(films_url)
    response = HTTParty.get(films_url)

    # Turn an array of hashes (results) into an array of `Film` objects.
    response.parsed_response["results"].map { |hash| Film.new(hash) }
  end

  def initialize(details)
    @details = details

    define_attributes(%w{title opening_crawl}, details)
  end

  def characters
    @characters ||= @details["characters"].map { |url| Character.new(url) }
  end
end
