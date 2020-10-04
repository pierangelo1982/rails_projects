class AddColumnTelaioToCar < ActiveRecord::Migration
  def change
    add_column :cars, :telaio, :string, :default => 0
  end
end
