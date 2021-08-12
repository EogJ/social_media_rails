class HomeController < ApplicationController
  def index
    render json: SocialActivity.new
  end
end
