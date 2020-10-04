class AddColumnNameToInternodata < ActiveRecord::Migration
  def change
    add_reference :internodata, :lavorazione, index: true
  end
end
