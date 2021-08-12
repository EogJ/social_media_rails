require "test_helper"

class TwitterTest < ActiveSupport::TestCase
  test ".wrap" do
    json = [
      {"username" => "@test1", "tweet" => "tweet1"},
      {"username" => "@test2", "tweet" => "tweet2"}
    ]

    result = Twitter.wrap_from_json(json)

    assert_equal 2, result.length
    assert_equal "@test1", result.first.username
    assert_equal "@test2", result.second.username
    assert_equal "tweet1", result.first.tweet
    assert_equal "tweet2", result.second.tweet
  end
end
