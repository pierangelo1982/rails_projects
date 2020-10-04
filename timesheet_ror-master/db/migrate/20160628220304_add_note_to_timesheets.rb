class AddNoteToTimesheets < ActiveRecord::Migration
  def change
    add_column :timesheets, :note, :text
  end
end
