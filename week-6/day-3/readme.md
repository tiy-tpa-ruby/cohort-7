
- httparty: http://www.rubydoc.info/github/jnunemaker/httparty
- httparty: https://github.com/jnunemaker/httparty
- json: http://json.org
- json example: http://json.org/example.html
- jsonlint for reformatting and validating JSON: http://jsonlint.com

Example of an API, money exchange:
- http://fixer.io
  - It is even a Ruby app (Sinatra!)
- Try this in terminal: http http://api.fixer.io/latest
- Wrap in some Ruby code:

  ```ruby
  require 'httparty'
  require 'json'

  response = HTTParty.get("http://api.fixer.io/latest")
  exchange_data = JSON.parse(response.body)
  puts "The exchange rate to CAD is #{exchange_data["rates"]["CAD"]}"
  ```
