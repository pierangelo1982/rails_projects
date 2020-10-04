class CreateWorktypes < ActiveRecord::Migration
  def change
    create_table :worktypes do |t|
      t.integer :work_id
      t.integer :worktypolgy

      t.timestamps
    end
  end
end
