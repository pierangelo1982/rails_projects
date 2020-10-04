class AddNettoToEntrata < ActiveRecord::Migration
  def change
    add_column :entrata, :entrata_netto, :decimal, :precision => 60, :scale => 2
  end
end
