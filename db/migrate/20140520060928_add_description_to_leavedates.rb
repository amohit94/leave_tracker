class AddDescriptionToLeavedates < ActiveRecord::Migration
  def change
  	add_column :leavedates, :description, :string
  end
end
