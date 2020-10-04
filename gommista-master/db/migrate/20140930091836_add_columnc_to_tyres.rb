class AddColumncToTyres < ActiveRecord::Migration
  def change
    add_column :tyres, :deposito, :boolean
  end
end
