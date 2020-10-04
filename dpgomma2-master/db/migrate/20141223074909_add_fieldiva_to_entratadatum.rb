class AddFieldivaToEntratadatum < ActiveRecord::Migration
  def change
    add_column :entratadata, :entratumtotaleivato, :decimal, :precision => 60, :scale => 2
  end
end
