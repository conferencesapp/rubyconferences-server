class AddTypeToConferences < ActiveRecord::Migration
  def change
    add_column :conferences, :type, :string, default: "RubyConference"

    change_column :conferences, :type, :string, null: false, index: true
    change_column_default :conferences, :type, nil
  end
end
