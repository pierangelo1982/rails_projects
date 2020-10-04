class AddExitToExitdata < ActiveRecord::Migration
  def change
    add_reference :exitdata, :exit, index: true
  end
end
