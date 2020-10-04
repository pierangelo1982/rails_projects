class CreateWorktypologies < ActiveRecord::Migration
  def change
    create_table :worktypologies do |t|
      t.string :nome
      t.string :prezzo

      t.timestamps
    end
  end
end
