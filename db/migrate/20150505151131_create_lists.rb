class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.boolean :status, default: false

      t.timestamps null: false
    end
  end
end
