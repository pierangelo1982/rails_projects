class CreateExtralavoroworks < ActiveRecord::Migration
  def change
    create_table :extralavoroworks do |t|
      t.integer :work_id
      t.integer :lavoro

      t.timestamps
    end
  end
end
