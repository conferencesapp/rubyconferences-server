class AddCfpEndAtToConferences < ActiveRecord::Migration
  def change
    add_column :conferences, :cfp_end_at, :datetime
  end
end
