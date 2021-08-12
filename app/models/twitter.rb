class Twitter
  def self.wrap_from_json(attrs)
    attrs.map do |t|
      new(username: t.fetch("username"), tweet: t.fetch("tweet"))
    end
  end

  attr_reader :username, :tweet

  def initialize(username:, tweet:)
    @username = username
    @tweet = tweet
  end
end
