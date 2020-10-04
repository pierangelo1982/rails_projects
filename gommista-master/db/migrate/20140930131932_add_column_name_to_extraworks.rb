class AddColumnNameToExtraworks < ActiveRecord::Migration
  def change
    add_column :extraworks, :data, :date
    add_column :extraworks, :km, :string
  end
end
