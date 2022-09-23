class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.date :date
      t.string :task
      t.boolean :status, default: false 

      t.timestamps
    end
  end
end
