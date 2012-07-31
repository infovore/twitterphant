class Searchterm < ActiveRecord::Base
  has_many :tweets, :dependent => :destroy

  def refresh!
    grab_tweets
  end

  def initial_import!
    grab_tweets(1000)
  end

  def grab_tweets(n=100)
    Twitter.search(self.text, :rpp => n, :result_type => "recent").results.each do |status|
      Tweet.create_status_if_nonexsitent_for_searchterm(status, self)
    end
  end

  def slugify
    text.strip.downcase.gsub(/\s*[^A-Za-z0-9\.\-]\s*/, '_')
  end
end
