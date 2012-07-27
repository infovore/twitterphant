class Tweet < ActiveRecord::Base
  belongs_to :searchterm

  def self.create_status_if_nonexsitent_for_searchterm(status,searchterm)
    unless(self.where(:tweet_id_string => status.id.to_s).any?)
      t = self.new
      t.searchterm_id = searchterm.id
      t.from_user = status.from_user
      t.from_user_id = status.from_user_id
      t.from_user_name = status.from_user_name
      t.tweeted_at = status.created_at
      t.image_url = status.profile_image_url
      t.tweet_id_string = status.id.to_s
      t.text = status.text
      t.save
    end
  end

  def url
    "https://twitter.com/#{from_user_id}/status/#{tweet_id_string}"
  end
end
