class RemoveUserIconFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :user_icon
  end
end
