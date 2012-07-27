class CreateSearchterms < ActiveRecord::Migration
  def change
    create_table :searchterms do |t|
      t.string :text
      t.timestamps
    end
  end
end
