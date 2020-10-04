class AddFieldToEntratadatum < ActiveRecord::Migration
  def change
    add_column :entratadata, :entratadatumtotale, :decimal, :precision => 60, :scale => 2
  end
end
