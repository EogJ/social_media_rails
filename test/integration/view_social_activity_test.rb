require "test_helper"

class ViewSocialActivityTest < ActionDispatch::IntegrationTest
  def setup
    stub_request(:any, "https://takehome.io/twitter")
      .to_return(status: 200, body: twitter_feed, headers: {"Content-Type" => "application/json"})

    stub_request(:any, "https://takehome.io/facebook")
      .to_return(status: 200, body: facebook_feed, headers: {"Content-Type" => "application/json"})

    stub_request(:any, "https://takehome.io/instagram")
      .to_return(status: 200, body: instagram_feed, headers: {"Content-Type" => "application/json"})
  end

  test "displays social activity" do
    get root_path, as: :json
    assert response.body.include? "\"twitter\":[{\"username\":\"tweeter\",\"tweet\":\"their tweet\"}]"
    assert response.body.include? "\"facebook\":[{\"name\":\"fber\",\"status\":\"their status\"}]"
    assert response.body.include? "\"instagram\":[{\"username\":\"instaer\",\"picture\":\"their picture\"}]"
  end

  def twitter_feed
    "[{\"username\":\"tweeter\",\"tweet\":\"their tweet\"}]"
  end

  def facebook_feed
    "[{\"name\":\"fber\",\"status\":\"their status\"}]"
  end

  def instagram_feed
    "[{\"username\":\"instaer\",\"picture\":\"their picture\"}]"
  end
end
