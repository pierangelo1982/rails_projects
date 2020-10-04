class AddAttachmentImportaddtToEntrata < ActiveRecord::Migration
  def self.up
    change_table :entrata do |t|
      t.attachment :importaddt
    end
  end

  def self.down
    remove_attachment :entrata, :importaddt
  end
end
