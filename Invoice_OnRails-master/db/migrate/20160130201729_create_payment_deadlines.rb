class CreatePaymentDeadlines < ActiveRecord::Migration
  def change
    create_table :payment_deadlines do |t|
      t.belongs_to :invoice, index: true, foreign_key: true
      t.date :data
      t.string :testo
      t.text :note

      t.timestamps null: false
    end
  end
end
