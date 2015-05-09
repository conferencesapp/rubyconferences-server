class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :token, unique: true, null: false
      t.timestamps null: false
    end
  end
end
