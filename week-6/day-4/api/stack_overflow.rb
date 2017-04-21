require 'httparty'
require 'json'

# Senior Engingeer might write the class for this
class StackOverflow
  def questions(current_page = 1)
    response = HTTParty.get("https://api.stackexchange.com/2.2/questions",
                            {
                              query: {
                                page: current_page,
                                pagesize: 5,
                                order: "desc",
                                sort: "activity",
                                site: "stackoverflow",
                              }
                            })
    questions = JSON.parse(response.body)

    return questions["items"]
  end
end
