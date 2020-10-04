class CreateCatextraworks < ActiveRecord::Migration
  def change
    create_table :catextraworks do |t|
      t.string :nome
      t.string :altro
      t.string :prezzo

      t.timestamps
    end
  end
end
