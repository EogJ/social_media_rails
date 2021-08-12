class Instagram
  def self.wrap_from_json(attrs)
    attrs.map do |t|
      new(username: t.fetch("username"), picture: t.fetch("picture"))
    end
  end

  attr_reader :username, :picture

  def initialize(username:, picture:)
    @username = username
    @picture = picture
  end
end
