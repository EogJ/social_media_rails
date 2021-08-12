class JsonFromUrl
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def call
    begin
      uri = URI(url)
      response = Net::HTTP.get(uri)
      t = JSON.parse(response)
    rescue JSON::ParserError => e
      []
    end
  end
end
