class AddNullConstraintToConferences < ActiveRecord::Migration
  def change
    change_column :conferences, :name, :string, null: false
    change_column :conferences, :location, :string, null: false
    change_column :conferences, :twitter_username, :string, null: false
    change_column :conferences, :image_url, :string, null: false
    change_column :conferences, :website, :string, null: false
    change_column :conferences, :start_date, :date, null: false
    change_column :conferences, :end_date, :date, null: false
  end
end
