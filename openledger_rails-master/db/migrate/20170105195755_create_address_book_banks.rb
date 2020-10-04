class CreateAddressBookBanks < ActiveRecord::Migration[5.0]
  def change
    create_table :address_book_banks do |t|
      t.belongs_to :address_book, foreign_key: true
      t.string :name
      t.string :abi
      t.string :cab
      t.string :iban
      t.text :note

      t.timestamps
    end
  end
end
