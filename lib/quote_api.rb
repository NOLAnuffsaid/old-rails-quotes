require 'httparty'

class QuotesApi
  def get_quotes
    store_quotes(parse_quotes(quotes_response))
  end

  private

  def parse_quotes(q_json)
    JSON.parse q_json
  end

  def quotes_response
    HTTParty.post(API_URL, headers: headers)
  end

  def store_quotes(q_arr_hash)
    q_arr_hash.map { |q| Quote.create q }
  end

  NUM_OF_QUOTES = "5"
  QUOTE_CATEGORY = "famous"
  API_URL = "https://andruxnet-random-famous-quotes.p.mashape.com/?cat=#{QUOTE_CATEGORY}&count=#{NUM_OF_QUOTES}"

  def headers
    {
      "X-Mashape-Key" => "38INv7V7hImsh5fJXlGgj0s3hSJwp1Zne2njsnl28g88TCA6NY",
      "Content-Type" => "application/x-www-form-urlencoded",
      "Accept" => "application/jsonp"
    }
  end
end
