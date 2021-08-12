require 'net/http'
require 'json'

class FacebookRepo
  def all
    Facebook.wrap_from_json(src)
  end

  attr_reader :data_src

  def initialize(data_src = "https://takehome.io/facebook")
    @data_src = data_src
  end

  private

  def src
    JsonFromUrl.new(data_src).call
  end
end
