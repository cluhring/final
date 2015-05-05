class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :status, default: "procrastinating"
      t.string :description
      t.date :due_date
      t.integer :list_id

      t.timestamps null: false
    end
  end
end
