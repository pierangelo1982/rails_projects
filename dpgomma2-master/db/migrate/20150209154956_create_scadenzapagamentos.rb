class CreateScadenzapagamentos < ActiveRecord::Migration
  def change
    create_table :scadenzapagamentos do |t|
      t.belongs_to :invoice, index: true
      t.date :scadenza
      t.string :note

      t.timestamps
    end
  end
end
