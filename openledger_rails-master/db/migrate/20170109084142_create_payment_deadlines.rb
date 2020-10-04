class CreatePaymentDeadlines < ActiveRecord::Migration[5.0]
  def change
    create_table :payment_deadlines do |t|
      t.belongs_to :invoice, foreign_key: true
      t.decimal :price, :precision => 60, :scale => 2, :default => 0
      t.date :data
      t.boolean :paid, :default => false

      t.timestamps
    end
  end
end
