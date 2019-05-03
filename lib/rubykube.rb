  class Rubykube 

    def initialize

      url_host = ENV.fetch('URL_HOST')
      @connection = Faraday.new("http://" + url_host + "/api/v2") do |builder|
        # builder.response :logger
        builder.response :json
        builder.adapter :net_http
      end
    end

    def sell(volume, price)
      response = post(
        'orders',
        {
          market: 'psqusd',
          side:   'sell',
          volume: volume,
          price:  price
        }
      )

      response
    end

    def buy(volume, price)
        response = post(
          'orders',
          {
            market: 'psqusd',
            side:   'buy',
            volume: volume,
            price:  price
          }
        )
  
        response
      end
  
    private

    def post(path, params = nil)
      response = @connection.post do |req|
        req.headers = generate_headers
        req.url path
        req.body = params.to_json
      end
      response
    end

    def generate_headers
      unless ENV['API_BEARER_KEY'] then
        p "You have to specify, export API_BEARER_KEY='xxxx'."
      end
      api_key_header = 'Bearer ' + ENV['API_BEARER_KEY']
      nonce = Time.now.to_i.to_s
      {
        'Authorization' => api_key_header,
        'Content-Type' => 'application/json'
      }
    end
end
