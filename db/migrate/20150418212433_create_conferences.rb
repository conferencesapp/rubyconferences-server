class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :name
      t.string :location
      t.string :twitter_username
      t.string :image_url
      t.text :description
      t.timestamps null: false
    end
  end
end
