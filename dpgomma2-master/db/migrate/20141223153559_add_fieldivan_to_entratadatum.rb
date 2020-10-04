class AddFieldivanToEntratadatum < ActiveRecord::Migration
  def change
    add_column :entratadata, :entratumtotaleiva, :decimal, :precision => 60, :scale => 2
  end
end
