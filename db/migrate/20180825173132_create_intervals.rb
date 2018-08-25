class CreateIntervals < ActiveRecord::Migration[5.1]
  def change
    create_table :intervals do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :headline
      t.text :reflection
      t.references :task
      t.references :user
      t.timestamps
    end
  end
end
