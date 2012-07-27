class AddSearchtermIdToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :searchterm_id, :integer
  end
end
