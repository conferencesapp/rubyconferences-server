class CreateConferenceAnnouncements < ActiveRecord::Migration
  def change
    create_table :conference_announcements do |t|
      t.string :body
      t.boolean :sent, default: false, null: false
      t.integer :conference_id

      t.timestamps null: false
    end
  end
end
