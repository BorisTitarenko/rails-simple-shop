class AddUserIdToMessage < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :users_id
    add_column :messages, :user_id, :bigint
  end
end
