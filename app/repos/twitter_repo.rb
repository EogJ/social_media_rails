require 'net/http'
require 'json'

class TwitterRepo
  def all
    Twitter.wrap_from_json(src)
  end

  attr_reader :data_src

  def initialize(data_src = "https://takehome.io/twitter")
    @data_src = data_src
  end

  private

  def src
    JsonFromUrl.new(data_src).call
  end
end
