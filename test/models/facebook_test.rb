require "test_helper"

class FacebookTest < ActiveSupport::TestCase
  test ".wrap" do
    json = [
      {"name" => "abc1", "status" => "status1"},
      {"name" => "abc2", "status" => "status2"}
    ]

    result = Facebook.wrap_from_json(json)

    assert_equal 2, result.length
    assert_equal "abc1", result.first.name
    assert_equal "abc2", result.second.name
    assert_equal "status1", result.first.status
    assert_equal "status2", result.second.status
  end
end
