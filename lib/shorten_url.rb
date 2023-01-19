class ShortenUrl
  def initialize
    @connection = Faraday.new(url: urls[:host]) do |faraday|
      faraday.request :json

      faraday.response :json, content_type: /\bjson$/
      faraday.adapter Faraday.default_adapter
    end
  end

  def call(url)
    response = connection.get(urls[:shorten_link], params(url)).body

    return [false, nil] unless response.dig('url', 'status').to_i == 7

    p "Completed shorten URL == #{response.dig('url', 'shortLink')}"

    [true, response.dig('url', 'shortLink')]
  end

  private

  attr_reader :connection

  def urls
    @urls ||= {
      host: 'https://cutt.ly',
      shorten_link: '/api/api.php'
    }
  end

  def params(url)
    {
      key: ENV['CUTTLY_AUTH_KEY'],
      short: url
    }
  end
end
