class UpdateActiveColumnValue < ActiveRecord::Migration
  def change
    Conference.update_all(active: true)
  end
end
