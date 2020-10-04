class AddFieldToEntrata < ActiveRecord::Migration
  def change
    add_column :entrata, :pezzi_ricevuti, :integer
    add_column :entrata, :pezzi_scartati, :integer
  end
end
