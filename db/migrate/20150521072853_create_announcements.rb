class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :body, null: false
      t.boolean :sent, default: false, null: false
      t.timestamps null: false
    end
  end
end
