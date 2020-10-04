class CreateExtraworks < ActiveRecord::Migration
  def change
    create_table :extraworks do |t|
      t.belongs_to :car_id, index: true
      t.string :lavoro
      t.text :note
      t.time :tempo
      t.string :prezzo

      t.timestamps
    end
  end
end
