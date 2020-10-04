class AddCustumerToTimesheets < ActiveRecord::Migration
  def change
    add_reference :timesheets, :custumer, index: true, foreign_key: true
  end
end
