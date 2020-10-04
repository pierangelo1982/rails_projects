class AddAttachmentImmagineToPezzos < ActiveRecord::Migration
  def self.up
    change_table :pezzos do |t|
      t.attachment :immagine
    end
  end

  def self.down
    remove_attachment :pezzos, :immagine
  end
end
