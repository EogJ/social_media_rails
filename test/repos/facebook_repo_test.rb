require "test_helper"

class FacebookRepoTest < ActiveSupport::TestCase
  test "all" do
    json = stub("json")
    fbs = stub("fbs")
    json_loader = mock("json_loader", call: json)

    JsonFromUrl
      .expects(:new)
      .with("json_url")
      .returns(json_loader)

    Facebook
      .expects(:wrap_from_json)
      .with(json)
      .returns(fbs)

    assert_equal fbs, FacebookRepo.new("json_url").all
  end
end
