class Searchterm < ActiveRecord::Base
  has_many :tweets, :dependent => :destroy

  def refresh!
    grab_tweets(1000)
  end

  def initial_import!
    grab_tweets(1000)
  end

  def grab_tweets(n=100)
    Twitter.configure do |config|
      config.consumer_key = Rails.configuration.twitter_consumer_key
      config.consumer_secret = Rails.configuration.twitter_consumer_secret
      config.oauth_token = Rails.configuration.twitter_oauth_token
      config.oauth_token_secret = Rails.configuration.twitter_oauth_token_secret
    end

    Twitter.search(self.text, :count => n, :result_type => "recent").results.each do |status|
      Tweet.create_status_if_nonexsitent_for_searchterm(status, self)
    end
  end

  def slugify
    text.strip.downcase.gsub(/\s*[^A-Za-z0-9\.\-]\s*/, '_')
  end
end
