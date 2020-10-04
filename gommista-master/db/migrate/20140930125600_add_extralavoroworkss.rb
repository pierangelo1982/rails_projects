class AddExtralavoroworkss < ActiveRecord::Migration
  def change
  	 add_column :extralavoroworks, :catextrawork_id, :integer
  end
end
