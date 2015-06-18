class RemoveTypeFromConferences < ActiveRecord::Migration
  def change
    remove_column :conferences, :type, :string
  end
end
