class RemoveLocationNotNullConstraintFromConferences < ActiveRecord::Migration
  def change
    change_column :conferences, :location, :string, null: true
    change_column :conferences, :image_url, :string, null: true
    change_column :conferences, :website, :string, null: true
    change_column :conferences, :start_date, :date, null: true
    change_column :conferences, :end_date, :date, null: true
  end
end
