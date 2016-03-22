class DropAnnouncements < ActiveRecord::Migration
  def up
    drop_table :announcements
  end

  def down
    create_table "announcements", force: :cascade do |t|
      t.string   "body",                       null: false
      t.boolean  "sent",       default: false, null: false
      t.datetime "created_at",                 null: false
      t.datetime "updated_at",                 null: false
    end
  end
end
