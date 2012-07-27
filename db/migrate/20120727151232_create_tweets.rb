class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :tweet_id_string
      t.string :from_user
      t.string :from_user_id
      t.string :from_user_name
      t.timestamp :tweeted_at
      t.string :image_url
      t.string :text
      t.timestamps
    end
  end
end
