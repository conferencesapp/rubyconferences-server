class AddConferenceTypeToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :conference_type, :integer, default: 0

    change_column :devices, :conference_type, :integer, null: false, index: true
    change_column_default :devices, :conference_type, nil
  end
end
