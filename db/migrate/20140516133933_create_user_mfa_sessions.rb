class CreateUserMfaSessions < ActiveRecord::Migration
  def change
    create_table :user_mfa_sessions do |t|

      t.timestamps
    end
  end
end
