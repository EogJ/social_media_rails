require "test_helper"

class InstagramRepoTest < ActiveSupport::TestCase
  test "all" do
    json = stub("json")
    instas = stub("instas")
    json_loader = mock("json_loader", call: json)

    JsonFromUrl
      .expects(:new)
      .with("json_url")
      .returns(json_loader)

    Instagram
      .expects(:wrap_from_json)
      .with(json)
      .returns(instas)

    assert_equal instas, InstagramRepo.new("json_url").all
  end
end
