class CreateVehicleCardAcceptances < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicle_card_acceptances do |t|
      t.datetime :date_vehicle_reception
      t.belongs_to :employee, foreign_key: true
      t.integer :document_number
      t.belongs_to :address_book, foreign_key: true
      t.integer :km
      t.string :serial_number
      t.string :vehicle_year
      t.datetime :vehicle_registered_in
      t.string :vehicle_model
      t.text :note

      t.timestamps
    end
  end
end
