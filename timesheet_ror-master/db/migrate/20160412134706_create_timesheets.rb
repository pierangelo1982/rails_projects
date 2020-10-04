class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.belongs_to :worker, index: true, foreign_key: true
      t.date :data
      t.datetime :inizio
      t.datetime :fine
      t.decimal :ore, :precision => 60, :scale => 2, :default => 0
      t.decimal :costo, :precision => 60, :scale => 2, :default => 0
      t.text :location
      t.float :latitudine
      t.float :longitudine
      t.boolean :confermato

      t.timestamps null: false
    end
  end
end
