class AddAttachmentLibrettoToCars < ActiveRecord::Migration
  def self.up
    change_table :cars do |t|
      t.attachment :libretto
    end
  end

  def self.down
    remove_attachment :cars, :libretto
  end
end
