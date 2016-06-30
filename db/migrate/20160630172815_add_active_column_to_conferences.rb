class AddActiveColumnToConferences < ActiveRecord::Migration
  def change
    add_column :conferences, :active, :boolean, default: false
  end
end
