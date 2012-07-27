class Searchterm < ActiveRecord::Base
  has_many :tweets

  def refresh!
    Twitter.search(self.text, :rpp => 100, :result_type => "recent").results.each do |status|
      Tweet.create_status_if_nonexsitent_for_searchterm(status, self)
    end
  end
end
