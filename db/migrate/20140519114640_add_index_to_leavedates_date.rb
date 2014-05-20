class AddIndexToLeavedatesDate < ActiveRecord::Migration
  def change
  	add_index :leavedates, :date
  end
end
