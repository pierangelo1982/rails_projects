class AddDescrizioneToExtraworks < ActiveRecord::Migration
  def change
    add_column :extraworks, :descrizione, :string
  end
end
