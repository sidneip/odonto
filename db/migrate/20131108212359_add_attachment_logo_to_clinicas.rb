class AddAttachmentLogoToClinicas < ActiveRecord::Migration
  def self.up
    change_table :clinicas do |t|
      t.attachment :logo
    end
  end

  def self.down
    drop_attached_file :clinicas, :logo
  end
end
