class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.belongs_to :azienda, index: true
      t.string :nome
      t.string :abi
      t.string :cab
      t.string :numeroconto
      t.string :iban

      t.timestamps
    end
  end
end
