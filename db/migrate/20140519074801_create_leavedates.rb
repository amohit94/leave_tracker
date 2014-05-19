class CreateLeavedates < ActiveRecord::Migration
  def change
    create_table :leavedates do |t|
      t.integer :user_id
      t.date :date

      t.timestamps
    end
  end
end
