class CreateCustumerBanks < ActiveRecord::Migration
  def change
    create_table :custumer_banks do |t|
      t.belongs_to :custumer, index: true, foreign_key: true
      t.string :banca
      t.string :abi
      t.string :cab
      t.string :numero_conto
      t.string :iban

      t.timestamps null: false
    end
  end
end
