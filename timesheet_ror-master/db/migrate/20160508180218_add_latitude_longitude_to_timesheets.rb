class AddLatitudeLongitudeToTimesheets < ActiveRecord::Migration
  def change
    add_column :timesheets, :latitudine_fine, :float
    add_column :timesheets, :longitudine_fine, :float
  end
end
