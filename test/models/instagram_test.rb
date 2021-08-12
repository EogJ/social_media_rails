require "test_helper"

class InstagramTest < ActiveSupport::TestCase
  test ".wrap" do
    json = [
      {"username" => "abc1", "picture" => "pic1"},
      {"username" => "abc2", "picture" => "pic2"}
    ]

    result = Instagram.wrap_from_json(json)

    assert_equal 2, result.length
    assert_equal "abc1", result.first.username
    assert_equal "abc2", result.second.username
    assert_equal "pic1", result.first.picture
    assert_equal "pic2", result.second.picture
  end
end
