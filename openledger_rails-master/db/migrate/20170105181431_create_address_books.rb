class CreateAddressBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :address_books do |t|
      t.string :name
      t.string :vat
      t.string :tax_code
      t.string :address
      t.string :address_nr
      t.string :zip
      t.string :city
      t.string :country
      t.string :phone
      t.string :fax
      t.string :email
      t.string :web
      t.string :note
      t.boolean :customer
      t.boolean :supplier

      t.timestamps
    end
  end
end
