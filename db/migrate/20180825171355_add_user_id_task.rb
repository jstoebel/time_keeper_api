class AddUserIdTask < ActiveRecord::Migration[5.1]
  def change
    change_table :tasks do |t|
      t.references :user, foreign_key: true
    end
  end
end
