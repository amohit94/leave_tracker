class AddIndexToLeavedatesDate < ActiveRecord::Migration
  def change
  	add_index :leavedates, :date, unique: true
  end
end
