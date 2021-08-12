class SocialActivity
  attr_reader :twitter, :facebook, :instagram

  def initialize
    load_feeds
  end

  private

  def load_feeds
    threads = []
    threads << Thread.new { load_twitter }
    threads << Thread.new { load_facebook }
    threads << Thread.new { load_instagram }
    ThreadsWait.all_waits(*threads)
  end

  def load_twitter
    @twitter = TwitterRepo.new.all
  end

  def load_facebook
    @facebook = FacebookRepo.new.all
  end

  def load_instagram
    @instagram = InstagramRepo.new.all
  end
end
