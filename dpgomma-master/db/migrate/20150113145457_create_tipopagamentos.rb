class CreateTipopagamentos < ActiveRecord::Migration
  def change
    create_table :tipopagamentos do |t|
      t.string :titolo

      t.timestamps
    end
  end
end
