class AddAttachmentImageToWishes < ActiveRecord::Migration
  def self.up
    change_table :wishes do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :wishes, :image
  end
end
