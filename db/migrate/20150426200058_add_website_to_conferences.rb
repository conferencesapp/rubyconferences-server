class AddWebsiteToConferences < ActiveRecord::Migration
  def change
    add_column :conferences, :website, :string
  end
end
