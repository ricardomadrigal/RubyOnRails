class AddUserIdToSpdmUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :spdm_users, :user_id, :integer
    add_index :spdm_users, :user_id
  end
end
