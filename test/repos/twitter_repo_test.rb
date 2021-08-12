require "test_helper"

class TwitterRepoTest < ActiveSupport::TestCase
  test "all" do
    json = stub("json")
    tweets = stub("tweets")
    json_loader = mock("json_loader", call: json)

    JsonFromUrl
      .expects(:new)
      .with("json_url")
      .returns(json_loader)

    Twitter
      .expects(:wrap_from_json)
      .with(json)
      .returns(tweets)

    assert_equal tweets, TwitterRepo.new("json_url").all
  end
end
