class AddStartDateEndDateToConferences < ActiveRecord::Migration
  def change
    add_column :conferences, :start_date, :date
    add_column :conferences, :end_date, :date
  end
end
