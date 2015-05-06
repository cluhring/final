class AddAttachmentPdfToTasks < ActiveRecord::Migration
  def self.up
    change_table :tasks do |t|
      t.attachment :pdf
    end
  end

  def self.down
    remove_attachment :tasks, :pdf
  end
end
