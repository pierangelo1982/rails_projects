class CreateMagazzinos < ActiveRecord::Migration
  def change
    create_table :magazzinos do |t|
      t.belongs_to :azienda, index: true
      t.integer :npezzi
      t.integer :inlavorazio
      t.integer :pronti

      t.timestamps
    end
  end
end
