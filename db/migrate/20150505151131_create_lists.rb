class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.string :status, default: "unarchived"

      t.timestamps null: false
    end
  end
end
