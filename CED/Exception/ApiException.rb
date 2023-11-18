# if a method is responsible for getting stock info from a remote a API
def get_info
    begin
      response = HTTP.get(STOCKS_URL + "#{@symbol}/info")
  
      fail AuthenticationError if response.code == 401
      fail StockNotFoundError, @symbol if response.code == 404
      return JSON.parse response.body
    rescue JSON::ParserError
      retry
    end
  end