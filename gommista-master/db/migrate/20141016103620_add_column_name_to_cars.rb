class AddColumnNameToCars < ActiveRecord::Migration
  def change
    add_column :cars, :libretto, :string
  end
end
