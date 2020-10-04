class CreateExitEntrata < ActiveRecord::Migration
  def change
    create_table :exit_entrata do |t|
      t.belongs_to :exit, index: true
      t.belongs_to :entratum, index: true

      t.timestamps
    end
  end
end
